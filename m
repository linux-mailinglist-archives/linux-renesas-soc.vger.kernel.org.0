Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC1175A297
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jul 2023 01:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjGSXDA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 19:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjGSXDA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 19:03:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3381E123;
        Wed, 19 Jul 2023 16:02:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AAD8E61856;
        Wed, 19 Jul 2023 23:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9206FC433C8;
        Wed, 19 Jul 2023 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689807778;
        bh=5N+HmeES9+X/u/2oQjY6EpDHuhIaYcHk+7LLaOxJuDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OiMjv4Kpx8xTvH193KF1+gm8WVore5Of49Dop7h75FaLnaW/s5X03VkhCE06FDUTz
         P1Qlytn7l4++7n/+FGi9bgb7fCfQ8amzFXhXGv5By+K623V9pS5X6UCS7CqU+WurNQ
         RKno/kLydQUXWqPD2dIdYk3ZzkJQ4DeJ5CSIDddVoKYJ7jyZc9cpS7vGkZRtVmy2Wj
         CwhGkhxrXSn15iRzQ+EJSvdsnsBUKNqxGMob6gxpTesTu65hLw2MsIJqNAu4jT1SEZ
         f4Lbwt99bnzKAXsXKLx0Y7UMEAaaAPSlI9W4k0FaQeZb4N+w0F6vZD/A4dj7VbtfIE
         IWcWj201L8JGA==
Received: (nullmailer pid 925996 invoked by uid 1000);
        Wed, 19 Jul 2023 23:02:56 -0000
Date:   Wed, 19 Jul 2023 17:02:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] of: dynamic: Do not use "%pOF" while holding
 devtree_lock
Message-ID: <20230719230256.GA900970-robh@kernel.org>
References: <cover.1689776064.git.geert+renesas@glider.be>
 <416d1ea056bb2d7ec6f21d8919b96a3d48099344.1689776064.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <416d1ea056bb2d7ec6f21d8919b96a3d48099344.1689776064.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 19, 2023 at 05:00:01PM +0200, Geert Uytterhoeven wrote:
> Formatting strings using "%pOF" while holding devtree_lock causes a
> deadlock.  Lockdep reports:
> 
>     of_get_parent from of_fwnode_get_parent+0x18/0x24
>     ^^^^^^^^^^^^^

I'm wondering if we really need the lock in there. We never unset or 
change the parent. It gets detached, but we're not checking for that. 
The node could get freed, but the lock is not for that, refcounts are.

>     of_fwnode_get_parent from fwnode_count_parents+0xc/0x28

count parents? Huh? Isn't it always 1? 

>     fwnode_count_parents from fwnode_full_name_string+0x18/0xac
>     fwnode_full_name_string from device_node_string+0x1a0/0x404
>     device_node_string from pointer+0x3c0/0x534
>     pointer from vsnprintf+0x248/0x36c
>     vsnprintf from vprintk_store+0x130/0x3b4
> 
> Fix this by making the locking cover only the parts that really need it.
> 
> Fixes: 0d638a07d3a1e98a ("of: Convert to using %pOF instead of full_name")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/of/dynamic.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index e311d406b1705306..eae45a1c673ee05f 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -601,13 +601,16 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
>  
>  	__of_changeset_entry_dump(ce);
>  
> -	raw_spin_lock_irqsave(&devtree_lock, flags);
>  	switch (ce->action) {
>  	case OF_RECONFIG_ATTACH_NODE:
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
>  		__of_attach_node(ce->np);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);

I think you could just move the spinlock into __of_attach_node(). The 
only other caller looks like this.

>  		break;
>  	case OF_RECONFIG_DETACH_NODE:
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
>  		__of_detach_node(ce->np);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  		break;
>  	case OF_RECONFIG_ADD_PROPERTY:
>  		/* If the property is in deadprops then it must be removed */
> @@ -619,7 +622,9 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
>  			}
>  		}
>  
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
>  		ret = __of_add_property(ce->np, ce->prop);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  		if (ret) {
>  			pr_err("changeset: add_property failed @%pOF/%s\n",
>  				ce->np,
> @@ -628,7 +633,9 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
>  		}
>  		break;
>  	case OF_RECONFIG_REMOVE_PROPERTY:
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
>  		ret = __of_remove_property(ce->np, ce->prop);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  		if (ret) {
>  			pr_err("changeset: remove_property failed @%pOF/%s\n",
>  				ce->np,
> @@ -647,7 +654,9 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
>  			}
>  		}
>  
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
>  		ret = __of_update_property(ce->np, ce->prop, &old_prop);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  		if (ret) {
>  			pr_err("changeset: update_property failed @%pOF/%s\n",
>  				ce->np,
> @@ -658,7 +667,6 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
>  	default:
>  		ret = -EINVAL;
>  	}
> -	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
>  	if (ret)
>  		return ret;
> -- 
> 2.34.1
> 
