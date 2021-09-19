Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9B1410A1E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Sep 2021 07:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhISFQs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Sep 2021 01:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbhISFQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Sep 2021 01:16:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AE7C061574
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Sep 2021 22:15:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i4so52187353lfv.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Sep 2021 22:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=sP611si2jBr9zfzoPwHDSy1T+hKia+hevrzf0AamrzQ=;
        b=d2Dbp/+PAuUV5nh2rcC3y0sv4OKQSUAnCDmE3VFOCApH5Ogm6rgyEUMXT9JjD/I21S
         krnNzJCTTpY9W5BI0DFJFKBhZrYvYRO9Pg3XsXnvqMQvSaqKFN5yQX7UypH+uWCyeSCU
         2+c4rq5ZdpfWvETavOAtcOgQiBNBlr91eYgA1moZBX11mVUXTUuvbk13A/ZwMIJKgNd/
         /2K41NEAr9ywAX3RcqcvGL5KnsCoOtOwatDn9QiO23VOdvvbOEDUOvgGAIl7EtT643EE
         J4kOUi+sFLH/jE6FMzXyUjd69YU4nSuz3sqorkA0qmVtq+GTp57356TRoojM/toq+U2z
         KuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sP611si2jBr9zfzoPwHDSy1T+hKia+hevrzf0AamrzQ=;
        b=D8LXa7VhnkhFrNCp1F4jU11zO2M910XX0JKmH4L3ZKrjQcNK04mYClYDZSNm13FTTr
         hy2TxngnAziTjLEJs75c0yveOkvV/Ua4mqooCGYgMVbk4a7MmsNaTONGKel093hKy/LG
         WmcUpbErUmn4QVnoC/F1W9Dx07WHf6swOfWVLEajl1Y0xZ1NWWsdtqBH1rrifoJ7Kcla
         TR5c0jSjCz9WkiojJQPzP9+cRlztKa/d4uzDrxJ2t1LfSyzwTWFhPrSiV9mx5YSEJDIC
         qCuHyGtgssCs28eRkf3IRfGtKavV21GUTCwqOwo9hJNtYsyk0Mr8gvzAZm4MnkdTP0ck
         FHww==
X-Gm-Message-State: AOAM531+cNkZ0Wv1sgL5R+3/VpKk+tDjE9UYMnWVT2nhxknpSCEOdiAm
        LfH6z4jUoDCu8eaB38q/4IJJKcI+Hum8B+RQ7JbONmn60cw/wQ==
X-Google-Smtp-Source: ABdhPJyaL7nsZh67yk91ZMJEeMm81bY8529MA1lM5AzD1YdMjMjQ8rFiEB9lNeuhAbDMpv7b88AeYTkRHuloOXyVFY0=
X-Received: by 2002:a2e:8810:: with SMTP id x16mr17699544ljh.410.1632028520293;
 Sat, 18 Sep 2021 22:15:20 -0700 (PDT)
MIME-Version: 1.0
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Sun, 19 Sep 2021 14:15:08 +0900
Message-ID: <CANqRtoQVwr9hKBzrixuQ8Z2qTyJiY8egyTNEQiudsoY2jPBz2w@mail.gmail.com>
Subject: R-Car Gen3 Network Based Flash Programming Tool for SCIF D/L Mode
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi everyone,

Embedded systems traditionally have several options when it comes to
flash programming such as external JTAG devices, boot loader and/or
operating system functionality. In case the flash is empty, on R-Car
Gen3 there are two choices for flash programming: JTAG or using MD
pins to select on-chip ROM boot instead of external storage. Out of
several different boot modes available the SCIF D/L mode allows for
software upload via an UART interface.

Traditionally binary images provided by Renesas have been used
together with the SCIF D/L mode. For such binaries the user was often
requested to perform various board specific operations such as
adjusting DIP switches and input addresses via the UART interface.
Source code and documentation for "flash_writer" has been released at
https://github.com/renesas-rcar/flash_writer/

Once the on-board storage has been initially programmed other software
may be used for additional flash programming. Not utilizing SCIF D/L
mode but also making use of flash_writer functionality is the abloader
tool. Two software copies are stored in flash and may be switched
between. It is available at https://github.com/marex/abloader

The subject of this email "R-Car Gen3 Network Based Flash Programming
Tool for SCIF D/L Mode" describes what in practice is just a
chain-loaded U-Boot with networking support. But to get there several
components are made use of:

- Failsafe ROM-based SCIF D/L mode
- Chain loading by U-Boot SPL
- Hardware setup using ATF BL2 with RCAR_RPC_HYPERFLASH_LOCKED=0
- Networked flash programming via U-Boot DFU TFTP functionality

The target platform in this case happens to be R-Car H3 ES2
Salvator-XS but the instructions should be generic enough as long as
U-Boot support exists for the target and SCIF D/L mode can be enabled.

- - -

Step 1: Compiling the Flash Programming Tool

Required software components are ATF and U-Boot.


Step 1A: ATF

For ATF the following git repository and commit have been used:
https://github.com/ARM-software/arm-trusted-firmware/commit/8078b5c5a

The ATF source code needs to be patched for SCIF D/L chain loading to work:
https://github.com/marex/arm-trusted-firmware/commit/ced85c01d886cc39f51cc9dd3bae72e7061886a7

Generic build instructions for R-Car Gen3 ATF are available at:
https://elinux.org/R-Car/Boards/ATF-Gen3
This includes information about how to setup MBEDTLS_DIR.

For SCIF D/L chain loading some customization is needed:
- Let U-Boot access the RPC HF via RCAR_RPC_HYPERFLASH_LOCKED=0
- No need for OPTEE so set SPD=none

The exact commands used to build the ATF source code are:
$ CROSS_COMPILE=_ make PLAT=rcar LSI=H3 MACHINE=salvator-x
DCAR_DRAM_SPLIT=1 RCAR_DRAM_LPDDR4_MEMCONF=0 SPD=none
RCAR_RPC_HYPERFLASH_LOCKED=0 MBEDTLS_DIR bl2
$ cp build/rcar/release/bl2.bin bl2-scif.bin


Step 1B: U-Boot

For U-Boot the v2021.10-rc4 was selected since it is the latest release:
https://source.denx.de/u-boot/u-boot/-/tags/v2021.10-rc4

For flash programming to work on this particular target platform the
DTS source for the board needs to be modified. For this board the
following rpc node needs to be enabled:
arch/arm/dts/r8a77950--salvator-x-u-boot.dts

Instructions related to U-Boot on R-Car Gen3 (see "U-Boot recovery
SPL") are available at: https://elinux.org/R-Car/Boards/U-Boot-Gen3

For SCIF D/L case build the source code and compress the binary using:
$ make CROSS_COMPILE=_ rcar3_salvator-x_defconfig
$ make CROSS_COMPILE=_
$ cp spl/u-boot-spl.scif .
$ cp u-boot.bin u-boot-scif.bin
$ cat u-boot-scif.bin | gzip -9 - > u-boot-scif.bin.gz

Create chain loading images using:
$ ./tools/mkimage -A arm -O arm-trusted-firmware -T firmware -C none
-a 0xe6304000 -e 0xe6304000 -n "BL2" -d bl2-scif.bin bl2-scif.uimage
$ ./tools/mkimage -A arm -O u-boot -T firmware -C gzip -a 0x50000000
-e 0x50000000 -n "U-Boot" -d u-boot-scif.bin.gz u-boot-scif.gz.img

The following files are needed for next step:
u-boot-spl.scif
bl2-scif.uimage
u-boot-scif.gz.img


- - -

Step 2: Using the Flash Programming Tool

Network transfer of software images for flash programming allows for
fast operation however the SCIF D/L boot with 3-step chain loading
takes some time and effort to get right.


Step 2A: Booting U-Boot from SCIF D/L mode

Adjust the MD pins to enable SCIF D/L mode and configure your terminal
program to 115200n81. Verify that a message is printed on the serial
port after power on. Once the "please send !" message appears start
ASCII upload of "u-boot-spl.scif". After a short while "U-Boot SPL,
Trying to boot from UART" will appear. Then it is time to upload
"bl2-scif.uimage" using ZMODEM/YMODEM/XMODEM protocol. After a while
plenty of BL2 messages appear followed by yet another "U-Boot SPL,
Trying to boot from UART". At such time proceed with upload of
"u-boot-scif.gz.img". Once finished the regular U-Boot user interface
will be available for console I/O.


Step 2B: U-Boot Flash Programming Example

Once the U-Boot user interface is presented a wide range of commands
are available. To update the flash with a multi-component fitImage the
following commands may be used:
=> setenv loadaddr 0x60000000
=> setenv bootfile update.itb
=> bootp
=> dfu tftp 0x60000000

The above 4 steps may be used to quickly update all components of the
on-board software stack. It however assumes that the file update.itb
is formatted as expected and the network environment is correctly
setup with services such as BOOTP/DHCP and TFTP.
