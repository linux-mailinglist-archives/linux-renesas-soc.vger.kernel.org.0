Return-Path: <linux-renesas-soc+bounces-21052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43DCB3AA53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 20:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838FF203699
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 18:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC9B2E1C78;
	Thu, 28 Aug 2025 18:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RS77eUp6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C1278E41
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756407113; cv=none; b=mPXVBGGugy+GiiDoE8iBxfbP8e4aazja29wU8AbC8AfbBTcI/25kzhNyKduTn7Hf1vGB+9rVWwn2Md9PAiyvzgHCcjBztJO9waY8X4KO8LEAhm6s1dIJ5Q5udiWUowDa0SM436B109te66maASyWWFDY9PerhTyPvVvsKZzo63c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756407113; c=relaxed/simple;
	bh=CyPCA9fjIo7i2UJHCPVEsCtLImklh8yo8faxpEt64e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wbtv295+VjPWnAvjCJ1yAI6Cl+0vxvk8NOYLHMj+da4KNZmNOIyG2kRtbjnn/zKYUJ+d+CKckos5QEUsMlwBv3oBMGC4pQvaFxSwqHxAso0jGBRqsaVQFTkPy/ndfpBvzG3djjC6Lq3Ma9FJnL0mp3K9DaSs5NSckcPxHoRiHLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RS77eUp6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso871925e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756407110; x=1757011910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfWnXEUbRmO2bZYKzeFSX9JXT8vaYtDeDLS56yh5lMM=;
        b=RS77eUp6yfsefn7GQzEdZ5rfa1XGVigo8knM7c+fWSjRBymuBFy5r/kF0PVwGZgB5Z
         lBPcLTo7cvIKrBmgp0xde5uRgCcpQuksPM0O2d4senlQ32ZPg+53ucj2HkEUjJF8w4lx
         k1aL7fb2y8FqTsN+qOyr3qQRttKh5ZZJDC9W2KTAsK24VPlOdiHRvcnG/39RxJnlNwhV
         3uFjI1ej5Y5xvMu/2jpYwePQsz6qvc5oiz6xGSsX/WPcum6RKyi4aSxIgJxEPb0NLRLF
         qvGzZ+1xFD0VkMdwrJ0QIUHaa5R+H6yLZfsOuoDjA6m4vV9qcZm1qVcg5bAtc32z4wYZ
         DDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756407110; x=1757011910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfWnXEUbRmO2bZYKzeFSX9JXT8vaYtDeDLS56yh5lMM=;
        b=vK3eZC3Dpc9UOlCUHLEn2TWc5/ZJ5rearzlBWOM/ltK4uMtircbJufR4fMNR3yrJMq
         VU/4udWA+5YAPmHLopTpz4UmFXd8CpDd1EXyefj58T3F3ALr+uU3CYEoMNbxgWynrsOw
         U9q9JZb6F9j2trV6Oev+HhvvzlWZRsohln4l3PVlcFrGYkYanMZ4bOLReWkltvmojdsk
         ibnR1f/nMJ7qfxx+dl8ozMkFSs3VcPEhJ7xPKcx9RqElXVWfiKkvPAMS59k79jfpwNN/
         gFZ/uit6Ecq4UMh7RBouDW2ivVB7prskPToEHOQxUJUf78Dqh8lnQpQMdZujAJS8WA0s
         2b6w==
X-Forwarded-Encrypted: i=1; AJvYcCXkfsMmWrWQz1cS+mYigIH865p/WEis20OiuSjSr91SQSESytIfEvfyWZJnLMZwv6TWS8TZiG/dxS8UqP8Vz0jn+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00cw/N6SrKflWyViTMNAUI/tw5e/+Mg5rgeZPjdfQuKNu1iP9
	8ZI6Ar3h5g/xGZRlQaF1SA6+NiDCeJUP1P/3BBbTVn/4CcnQt3PjdMQYslKVnE1ufgo77WoWtZM
	kNNOH
X-Gm-Gg: ASbGnctpfncCdfAFBP1j2rVuQGk08G3oDpE2apceayHK1p+poyBxfGCWoQqibE3XwK2
	6yrOuoS8pJrRY7HLKcj2fE5ere+l4UDACkPVxVvyNlZjGgEDTHdNz5KQuTwJQo/wjDN25s4+jlg
	+sEtfKhHNKr4nBCof5CvIjgaZC0wL7/t00boOnezT0EnZMumO7Vi4iOTUb0zVtPiil1ku7AXD3N
	SiqGyGwKlnALacghuE+6+mRjmR5q1sghM+nBCCGWKStSk1wqLvWCo1EkJrfZKcVVGiZlRv2Q4O/
	9XHwpFEVba0v/k5sbAejMAEZVXjrpLAhbW3P9IJuIMJGedQpfUFAHwkg87cSFDTIvN32td4O0At
	LajWjuuQ3o2w4CW5Tu/6KpSHQIhot5xvKBAF1Io22Wf2bopgVROWAKTxoTsHhg6FPqLmwXjtgeQ
	jHjQ==
X-Google-Smtp-Source: AGHT+IFH7UEDWbUy+TasCPo403tJMHIqZxhurwEarUivqN9QOFINaQbIWO0b2hiOs4lzpLzAs7zcyw==
X-Received: by 2002:a5d:64e8:0:b0:3cd:df50:49aa with SMTP id ffacd0b85a97d-3cddf505264mr2611694f8f.31.1756407109457;
        Thu, 28 Aug 2025 11:51:49 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd? ([2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fd01csm358610f8f.12.2025.08.28.11.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 11:51:49 -0700 (PDT)
Message-ID: <ae53d367-2ee5-49aa-82ba-86f9e84d4d25@tuxon.dev>
Date: Thu, 28 Aug 2025 21:51:46 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add initial USB support for the Renesas RZ/G3S SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <aLAZprjeKtk4pusw@shikoro>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aLAZprjeKtk4pusw@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 8/28/25 11:56, Wolfram Sang wrote:
> Hi Claudiu,
> 
>> Series adds initial USB support for the Renesas RZ/G3S SoC.
>>
>> Series is split as follows:
>> - patches 1-2/7		- fixes on bindings and driver for USB PHY
>> - patches 3-5/7		- updates the rzg2l-usbphy-ctrl driver and documentation
>> 			  with support for setting PWRRDY though SYSC
>> - patches 6-7/7		- add device tree support
> 
> Can you kindly send me a working config (privately will do). I think I
> enabled all the necessary config options but still get:
> 
> [    0.271024] rzg2l_usbphy_ctrl 11e00000.usbphy-ctrl: probe with driver rzg2l_usbphy_ctrl failed with error -22
> ...
> [   10.981612] platform 11e20000.usb: deferred probe pending: platform: supplier 11e10200.usb-phy not ready
> [   10.984103] platform 11e10200.usb-phy: deferred probe pending: platform: wait for supplier /soc/usbphy-ctrl@11e00000/regulator-vbus

I just checked it on latest linux-next and all good on my side. Would it be 
possible that you don't have commit 2da2740fb9c8 ("soc: renesas: rz-sysc: Add 
syscon/regmap support") in your tree?

This is how my tree looks like:

1db69bbb9c49 (HEAD) arm64: dts: renesas: rzg3s-smarc: Enable USB support
ee93ed9f0097 arm64: dts: renesas: r9a08g045: Add USB support
285447f934f3 reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
8c758908876c reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
8e41c54ab567 dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
02db7a65b4b3 phy: renesas: rcar-gen3-usb2: Fix an error handling path in 
rcar_gen3_phy_usb2_probe()
217453b58bdf dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
0f4c93f7eb86 (tag: next-20250822, linux-next/master) Add linux-next specific 
files for 20250822

and few checks on my board:

root@smarc-rzg3s:~# uname -r
6.17.0-rc2-next-20250822-00007-g1db69bbb9c49
root@smarc-rzg3s:~# [  217.627804] usb 1-1.2: USB disconnect, device number 4
[  217.627804] usb 1-1.2: USB disconnect, device number 4

root@smarc-rzg3s:~#
root@smarc-rzg3s:~#
root@smarc-rzg3s:~#
root@smarc-rzg3s:~# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 045b:022b Hitachi, Ltd
Bus 001 Device 003: ID 8087:0029 Intel Corp. AX200 Bluetooth
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
root@smarc-rzg3s:~# [  231.154575] usb 1-1.2: new high-speed USB device number 5 
using ehci-platform
[  231.154575] usb 1-1.2: new high-speed USB device number 5 using ehci-platform
[  231.299629] usb-storage 1-1.2:1.0: USB Mass Storage device detected
[  231.299629] usb-storage 1-1.2:1.0: USB Mass Storage device detected
[  231.327087] scsi host0: usb-storage 1-1.2:1.0
[  231.327087] scsi host0: usb-storage 1-1.2:1.0
[  232.348676] scsi 0:0:0:0: Direct-Access     SanDisk  Cruzer Blade     1.00 
PQ: 0 ANSI: 6
[  232.348676] scsi 0:0:0:0: Direct-Access     SanDisk  Cruzer Blade     1.00 
PQ: 0 ANSI: 6
[  232.382829] sd 0:0:0:0: [sda] 31260672 512-byte logical blocks: (16.0 GB/14.9 
GiB)
[  232.382829] sd 0:0:0:0: [sda] 31260672 512-byte logical blocks: (16.0 GB/14.9 
GiB)
[  232.417118] sd 0:0:0:0: [sda] Write Protect is off
[  232.417118] sd 0:0:0:0: [sda] Write Protect is off
[  232.430023] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, 
doesn't support DPO or FUA
[  232.430023] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, 
doesn't support DPO or FUA
[  232.481535]  sda: sda1
[  232.481535]  sda: sda1
[  232.490719] sd 0:0:0:0: [sda] Attached SCSI removable disk
[  232.490719] sd 0:0:0:0: [sda] Attached SCSI removable disk

root@smarc-rzg3s:~#
root@smarc-rzg3s:~#
root@smarc-rzg3s:~# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 045b:022b Hitachi, Ltd
Bus 001 Device 003: ID 8087:0029 Intel Corp. AX200 Bluetooth
Bus 001 Device 005: ID 0781:5567 SanDisk Corp. Cruzer Blade
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
root@smarc-rzg3s:~#
root@smarc-rzg3s:~#

Thank you for looking to this,
Claudiu

> 
> Thanks,
> 
>     Wolfram
> 


