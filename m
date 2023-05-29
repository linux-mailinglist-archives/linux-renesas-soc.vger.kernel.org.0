Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA25714866
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 13:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjE2LPf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 07:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjE2LPf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 07:15:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D41CD;
        Mon, 29 May 2023 04:15:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D2E36143D;
        Mon, 29 May 2023 11:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C6FC433EF;
        Mon, 29 May 2023 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685358932;
        bh=HpSUXwKb2rnl3AfJ391VCFRBDm65RJ9ib71YyO7876E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NWfGDGqHXwAue2zb66kIOIVb7gHbd9xG6XXbAWuaBZGBCmGxkSsHg8fom8ESCRrav
         taOuCRVvClvLdFMoegk5cWw9A6nMZzw2EMc+dsKDYGMGi367lHGUdGMDFW74dmm3Nu
         dlexRFL/9ixuJxFEtjNpCDNBWIwtzFDcXH+xEdYNmZJzyaYkP+feG3uGIw4ioyNdwh
         8IE7vQoRIAzAc/qq4zbpoYVrM4RUNWpqTeXi/8rRgqd7C/YbdH9Tiqle+ZBD5bVisl
         g95YC31T/zGJQ0Tw3scyvHbppK9nGEA258ODE/N6LHqCbJXM7skr40n4ZKdC+EwYgS
         pDCFpQ0gZYyoQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1q3aqY-0013Ky-GD;
        Mon, 29 May 2023 12:15:30 +0100
Date:   Mon, 29 May 2023 12:15:30 +0100
Message-ID: <871qizl771.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Zheng Wang <zyytlz.wz@163.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: Fix RZ/V2M {modprobe,bind} error
In-Reply-To: <OS0PR01MB59227D8298776A092F024F2A864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230526143615.372338-1-biju.das.jz@bp.renesas.com>
        <20230529061714.GA25984@pendragon.ideasonboard.com>
        <OS0PR01MB592296756992262EC6D382D0864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <86bki3cxm2.wl-maz@kernel.org>
        <OS0PR01MB59227E69FF1DE67327BDEF77864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <87353flavh.wl-maz@kernel.org>
        <OS0PR01MB59227D8298776A092F024F2A864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, zyytlz.wz@163.com, geert+renesas@glider.be, yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com, krzysztof.kozlowski@linaro.org, linux-usb@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 29 May 2023 11:03:27 +0100,
Biju Das <biju.das.jz@bp.renesas.com> wrote:
> 
> > Do you understand the meaning of the "dev" parameter you pass to
> > devm_request_irq()?
> 
> Yes, the resource is managed with particular device.

So what does it tell you about the life cycle of the interrupt you
request with the *wrong* device?

> I should not use devm_request_irq here. rather should use
> request_irq and free_irq during unload with parent device handle.

No, that's just papering over the real issue. You should just get the
driver that handles the interrupt to request it. Anything else is a
design bug.

	M.

-- 
Without deviation from the norm, progress is not possible.
