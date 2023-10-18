Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3537A7CDA50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 13:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjJRL1k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 07:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjJRL1g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 07:27:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7940128
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Oct 2023 04:27:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D39C433C7;
        Wed, 18 Oct 2023 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697628453;
        bh=cBS8iPeDj6slggeTZUr0Yc9TQoHt7y7o/45kNU8IDbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kyEqx+qCg14/Xbq+If6ae+zR1j4HJDc0QV0W35oQcyFjvWOgz5s+oI1YPd7F1kdfO
         OtMbry/ZzEfK02V3hunNL7jihBznljtaSJENPjbQepqPKOOG5AyQgjgx3Hw+XjtAuS
         +O95gxyt9g71/7tHJ7ksjx9DWzdwp/LMLhxtYJ/qLqejTklXzjpbSB4F3liHo+nbu4
         OBxS/RvnjPX7BP/VUdJawXLTYC/FSM8Kq0cnUoJk9mFM7jdVRh/8zUJHL1YagkEGX9
         o53bmx8QNeRSopaKv29f1EdSSrgfTZcVlx/wxnm5ez76LFsM7c8A1EZUFTL4UpgEP2
         IsRWBst2J5ZQA==
Date:   Wed, 18 Oct 2023 13:27:29 +0200
From:   Simon Horman <horms@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/2] rswitch: Add PM ops
Message-ID: <20231018112729.GL1940501@kernel.org>
References: <20231017113402.849735-1-yoshihiro.shimoda.uh@renesas.com>
 <20231017113402.849735-3-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017113402.849735-3-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 17, 2023 at 08:34:02PM +0900, Yoshihiro Shimoda wrote:
> Add PM ops for Suspend to Idle. When the system suspended,
> the Ethernet Serdes's clock will be stopped. So, this driver needs
> to re-initialize the Ethernet Serdes by phy_init() in
> renesas_eth_sw_resume(). Otherwise, timeout happened in phy_power_on().
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>

