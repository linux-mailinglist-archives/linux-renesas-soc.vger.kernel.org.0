Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A93477022C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Aug 2023 15:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbjHDNsF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Aug 2023 09:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjHDNsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Aug 2023 09:48:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059F4139
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Aug 2023 06:48:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C41A62032
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Aug 2023 13:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3827CC433C7;
        Fri,  4 Aug 2023 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691156882;
        bh=M3AVbzofjePunM1DJ7jUjc6Jb+HBc0C43cmjoAAht64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=og8ScSaRJ7ah3csLRIwxK6DDDeJSwU5/mFi3z9XBdxDr5V7yHSJNswUJrrVIG4GWg
         zRRLZ7NqW0YTI4kX/jwoJN+g1Jrh6YQiae1gHZbA0btZ+2c9NzAoT+pl6U5rzk2hMs
         /bKcCcIzcQ/poM0xXvlK25y/lIrEHgldy332svvNYgEP1fHoidhlKH+SGksC5no2Gi
         YJ2EghEpJnD9YI8gcRLSC0vpJAcdpqMSo3+l+FCq2992okRfRWGbkCyaT6rbiteZvx
         ZPQdkh77HID2E4LrbMqXQVzdf3rwJiexwkRViYnb6MDQe2wGpObheb6MLPXPegQmY0
         c59R7l3pbEvwA==
Date:   Fri, 4 Aug 2023 15:47:57 +0200
From:   Simon Horman <horms@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, alexanderduyck@fb.com
Subject: Re: [PATCH net-next 0/2] net: renesas: rswitch: Add speed change
 support
Message-ID: <ZM0BjaVJ6D+tAXOj@kernel.org>
References: <20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Alexander Duyck

On Thu, Aug 03, 2023 at 09:06:19PM +0900, Yoshihiro Shimoda wrote:
> Add speed change support at runtime for the latest SoC version.
> Also, add ethtool .[gs]et_link_ksettings.
> 
> Yoshihiro Shimoda (2):
>   net: renesas: rswitch: Add runtime speed change support
>   net: renesas: rswitch: Add .[gs]et_link_ksettings support

Thanks Shimoda-san,

this looks good to me.

For the series,

Reviewed-by: Simon Horman <horms@kernel.org>


