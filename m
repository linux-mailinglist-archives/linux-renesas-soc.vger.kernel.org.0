Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DD6681A6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 20:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237912AbjA3T0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 14:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbjA3T0m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 14:26:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0703E626
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 11:26:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 218FD60F83
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 19:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2632EC4339C;
        Mon, 30 Jan 2023 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675106774;
        bh=lRZ5OVWT+Zp7FtdYJktwP5tF3IeDF4JhM7kcYMebbJc=;
        h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
        b=JSBJNS6KJ1dnGaSEIQVukZniLyy2xgOtddeWqy4XvslXRFuK/zGiCItTLHhepXmIm
         +v/dm1aV3cN/K1CG6unClogggaqAhtmLHuJA2B6InLp//EUEVkFolUwBJmpT3kgVVP
         ZTFVojcIIuCbT4u9mjUCp9I9rhwP9t6XLntJpEVKAwlpN0zUqYQANFmujmwxIw5miP
         wegIwhRl7y7xcXffGB0DyX65HOlRCrUbbcBmC35otvXX10mJNkC2yd3n/P3YESVZRs
         FKqr2nmrvNu18fP6i0yJqTzm/E9U4N9e5nDJ+129aZynbZyQXBpm1R2Q5RxH1XGLlR
         DV2X2+PXADDLA==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id 081DF27C0054;
        Mon, 30 Jan 2023 14:26:13 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 14:26:13 -0500
X-ME-Sender: <xms:1BnYY1WW4cUzSOAuW2D4Dpz8BGwAdb-iLdCNYHXa57v07I1W7zRDnA>
    <xme:1BnYY1l8b4LuWxSZTVMIn-62w8hrBeR2EM9ZJKTHgmaKACPijICq9YMni2hX-FUbA
    pzbahqUVWDzT0-rysY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeeh
    udegtdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
    tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
    druggv
X-ME-Proxy: <xmx:1BnYYxZAnHr9NGG5dA9I7_LOTXlGX3-9kcAA5aMXHuSfBIGpl0L_vQ>
    <xmx:1BnYY4V5RgOoAY-wE-cFdgX1KAmsw1JGblhUDsrNh0Dg3hjiIk4Y0w>
    <xmx:1BnYY_n_Dk812Nxg4u5jWy6Y_4oRAIR8Z3nRcp93y7hDnYAyJiTFOg>
    <xmx:1RnYY9Y6ZauAj5u2ekP8rYyadaVKTYF-F0dh_u005nD0vBlGir5APQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 384ACB60086; Mon, 30 Jan 2023 14:26:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-106-gfe3ab13a96-fm-20230124.001-gfe3ab13a
Mime-Version: 1.0
Message-Id: <7973405f-3d17-4556-af45-792c8edbc391@app.fastmail.com>
In-Reply-To: <OS0PR01MB59220EFDE43A39D61FC73E2786D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202301301054.KVvGA5XO-lkp@intel.com>
 <OS0PR01MB59220EFDE43A39D61FC73E2786D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Date:   Mon, 30 Jan 2023 20:25:52 +0100
From:   "Arnd Bergmann" <arnd@kernel.org>
To:     "Biju Das" <biju.das.jz@bp.renesas.com>,
        "kernel test robot" <lkp@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc:     "Paul Gazzillo" <paul@pgazz.com>,
        "Necip Fazil Yildiran" <fazilyildiran@gmail.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies detected
 for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Content-Type: text/plain
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 30, 2023, at 19:54, Biju Das wrote:
> Hi all,
>
>> Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
>> detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
>> 
>> tree:
>> head:   c52c9acc415eb6ff54f658492f8c53da0fc3528a
>> commit: c52c9acc415eb6ff54f658492f8c53da0fc3528a [35/35] xhci: host: Add
>> Renesas RZ/V2M SoC support
>>         git remote add usb
>>         git fetch --no-tags usb usb-next
>>         git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
>>         # 1. reproduce by kismet
>>            # install kmax per
>>            kismet --linux-ksrc=linux --selectees CONFIG_USB_RZV2M_USB3DRD --
>> selectors CONFIG_USB_XHCI_RZV2M -a=csky
>>         # 2. reproduce by make
>>            # save the config file to linux source tree
>>            cd linux
>>            make ARCH=csky olddefconfig
>> 
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> 
>> kismet warnings: (new ones prefixed by >>)
>> >> kismet: WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
>> when selected by USB_XHCI_RZV2M
>>    .config:4492:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid
>> for ARCH_MMAP_RND_BITS
>> 
>>    WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
>>      Depends on [n]: USB_SUPPORT [=y] && USB_GADGET [=n] && (ARCH_R9A09G011
>> [=n] || COMPILE_TEST [=y])
>>      Selected by [y]:
>>      - USB_XHCI_RZV2M [=y] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD
>> [=y] && USB_XHCI_PLATFORM [=y] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])
>
> I have investigated this issue, 
>
> Just for testing, I have reverted Arnd's patch[1] and then done the 
> below changes 
> which is fixing unmet dependencies reported by the bot.
>
> Looks like USB_RZV2M_USB3DRD should depend upon both USB and 
> USB_GADGET. Previously
> It depends only on USB_GADGET.
>
> Also the USB3DRD driver should be in "driver/usb/renesas_usb3drd" 
> directory instead
> of "driver/usb/gadget/udc" as both HOST and device ctrlr need this 
> driver.
>
> So not sure, 
>
> 1) Use Arnd's patch for fixing this issue
>
> 2) Use the changes from [2]
>
> Or
>
> 3) Arnd's changes + changes from [2].
>
> Please let me know.
>
> [2]
> diff --git a/drivers/usb/renesas_usb3drd/Kconfig 
> b/drivers/usb/renesas_usb3drd/Kconfig
> new file mode 100644
> index 000000000000..6205d815d283
> --- /dev/null
> +++ b/drivers/usb/renesas_usb3drd/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config USB_RZV2M_USB3DRD
> +	tristate 'Renesas USB3.1 DRD controller'
> +	depends on (USB || USB_GADGET) 
> +	depends on ARCH_R9A09G011 || COMPILE_TEST
> +	default USB_XHCI_RZV2M
> +	default USB_RENESAS_USB3
> +	help
> +	   Renesas USB3.1 DRD controller is a USB DRD controller
> +	   that supports both host and device switching.
> +
> +	   Say "y" to link the driver statically, or "m" to build a
> +	   dynamically linked module called "rzv2m_usb3drd".

I found yet another regression, and I don't think any of the above
fully address this. Let me try to come up with a better fix that
also addresses this one:

arm-linux-gnueabi-ld: drivers/usb/host/xhci-rzv2m.o: in function `xhci_rzv2m_init_quirk':
xhci-rzv2m.c:(.text+0x20): undefined reference to `rzv2m_usb3drd_reset'
arm-linux-gnueabi-ld: drivers/usb/gadget/udc/renesas_usb3.o: in function `handle_ext_role_switch_states':
renesas_usb3.c:(.text+0x3148): undefined reference to `rzv2m_usb3drd_reset'
arm-linux-gnueabi-ld: renesas_usb3.c:(.text+0x31b8): undefined reference to `rzv2m_usb3drd_reset'
arm-linux-gnueabi-ld: renesas_usb3.c:(.text+0x3338): undefined reference to `rzv2m_usb3drd_reset'
arm-linux-gnueabi-ld: drivers/usb/gadget/udc/renesas_usb3.o: in function `renesas_usb3_start':
renesas_usb3.c:(.text+0x36b8): undefined reference to `rzv2m_usb3drd_reset'
arm-linux-gnueabi-ld: drivers/usb/gadget/udc/renesas_usb3.o:renesas_usb3.c:(.text+0x3764): more undefined references to `rzv2m_usb3drd_reset' follow

The main problem here is that the xhci-platform driver has reverse
dependencies on the soc specific portions, unlike drivers elsewhere
that handle this by having a soc specific driver that calls into
the more generic code library.

      Arnd
