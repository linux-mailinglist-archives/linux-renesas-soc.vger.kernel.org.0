Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394E787058
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2019 05:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbfHID5i convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Aug 2019 23:57:38 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40428 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729307AbfHID5i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Aug 2019 23:57:38 -0400
Received: from [192.168.1.102] (c-71-204-185-212.hsd1.ca.comcast.net [71.204.185.212])
        by kirsty.vergenet.net (Postfix) with ESMTPSA id 484A325AD78;
        Fri,  9 Aug 2019 13:57:36 +1000 (AEST)
Date:   Thu, 08 Aug 2019 20:57:32 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMuHMdUCb_7=yTb+E-CvbabdRgWRRg6DYzukWqzd_ZCexobnwg@mail.gmail.com>
References: <20190731073744.13963-1-geert+renesas@glider.be> <CAMuHMdUCb_7=yTb+E-CvbabdRgWRRg6DYzukWqzd_ZCexobnwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
From:   Simon Horman <horms@verge.net.au>
Message-ID: <C9A11CC5-8449-4C2A-AE04-E678EC52D7DB@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 8 August 2019 02:00:20 GMT-07:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>Hi Simon,
>
>On Wed, Jul 31, 2019 at 9:37 AM Geert Uytterhoeven
><geert+renesas@glider.be> wrote:
>> Currently there are two nodes named "regulator1" in the Draak DTS: a
>> 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
>> for the backlight.  This causes the former to be overwritten by the
>> latter.
>>
>> Fix this by renaming all regulators with numerical suffixes to use
>named
>> suffixes, which are less likely to conflict.
>>
>> Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add
>backlight")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> I guess this is a fix for v5.3?
>
>Do you plan to queue this as a fix for v5.3?
>Thanks!

Likewise, thanks.

Will do.

>
>>
>> This fix takes a slightly different approach than commit
>> 12105cec654cf906 ("arm64: dts: renesas: r8a77990: ebisu: Fix
>backlight
>> regulator numbering"), which just fixed the conflicting numerical
>> suffix.
>> ---
>>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
>b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
>> index 0711170b26b1fe1c..3aa2564dfdc25fff 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
>> @@ -97,7 +97,7 @@
>>                 reg = <0x0 0x48000000 0x0 0x18000000>;
>>         };
>>
>> -       reg_1p8v: regulator0 {
>> +       reg_1p8v: regulator-1p8v {
>>                 compatible = "regulator-fixed";
>>                 regulator-name = "fixed-1.8V";
>>                 regulator-min-microvolt = <1800000>;
>> @@ -106,7 +106,7 @@
>>                 regulator-always-on;
>>         };
>>
>> -       reg_3p3v: regulator1 {
>> +       reg_3p3v: regulator-3p3v {
>>                 compatible = "regulator-fixed";
>>                 regulator-name = "fixed-3.3V";
>>                 regulator-min-microvolt = <3300000>;
>> @@ -115,7 +115,7 @@
>>                 regulator-always-on;
>>         };
>>
>> -       reg_12p0v: regulator1 {
>> +       reg_12p0v: regulator-12p0v {
>>                 compatible = "regulator-fixed";
>>                 regulator-name = "D12.0V";
>>                 regulator-min-microvolt = <12000000>;
>> --
>> 2.17.1
>
>Gr{oetje,eeting}s,
>
>                        Geert
