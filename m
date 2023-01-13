Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72AFA66A1A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 19:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjAMSN0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 13:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjAMSM7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 13:12:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1FAA6BE7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2023 10:05:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 848B9B8211F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2023 18:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92971C433EF;
        Fri, 13 Jan 2023 18:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673633049;
        bh=bVMIBW9jGyd5k0cfhXoMsLYS7NcAAXWLrQcEnGyvVoo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kY2MC2HkJNNo1glxII3qKTVcUxepV8hPZbJUYoGTxwO8TGHkyduMHYPSYzFoADHzI
         aKXQE+4+Q0QFrOOGKJILx52g54LZ+mfaPFty3CieViuWz2cjRndZ2LCCgVEJyKvetp
         ++FJKKQ3VmXnqSBFnTDI7SNtaGm4z99VNzRccmb61GJ39VzKd2/bxjMkNU53V6hW/z
         sJLWcldVgNAV91iwwyOp5yWjw5y9XgS7QNN9MGtxOQi5+wQJw/dlgqQyNPh6dI14Fo
         u+UJB+AXrtOfAMmXa/hpUfICZS4rwqdNwTnDkfvR+URBTGYeFSsnTFFMdbAXj5Qxt5
         sSq3/GQWw5bSw==
Date:   Fri, 13 Jan 2023 23:34:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@kernel.org, linux-phy@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] phy: renesas: r8a779f0-eth-serdes: Add .power_on()
Message-ID: <Y8GdFaQ94xb06Adr@matsya>
References: <20221226065316.3895480-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226065316.3895480-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26-12-22, 15:53, Yoshihiro Shimoda wrote:
> Add initialization function for each channel from step 9 or later on
> the datasheet. Otherwise, the rswitch driver cannot initialize
> this SERDES hardware correctly.

Applied, thanks

-- 
~Vinod
