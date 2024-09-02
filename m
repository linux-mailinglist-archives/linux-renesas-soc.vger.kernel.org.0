Return-Path: <linux-renesas-soc+bounces-8613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB841968A40
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 16:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7213E2831AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 14:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D31D19F11E;
	Mon,  2 Sep 2024 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZIXITCE2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546919C55D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725288559; cv=none; b=sO4lhukHxvYv7U4jkUNFY2jQ54mO9tQN7jRXpSXG3+oUO+oBPC/rSuFhz4KsNv+1PMRpsaldbPFTTXzHQZ1vdCduMBOGl+eV8r4yeDyA146MMfKRBCZ+AxIESer0j3S2sH+rgO4PdfHOVf8ZEuMZtfOaG+u/A8aoQzXY2mR1Suk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725288559; c=relaxed/simple;
	bh=QQZENDYNrRjI++TX2FvbFKcTFkPxKoaouTHAXGq0ZcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJSeWdmKwdd1x5Hba2/mRQDFReVUICXCdzsI0akgaVeoRxS9r2nvx8L7FISGYHKFfAEFojQZHKnkAbgynNSARHQ01rQC4DM7JTeMRsPBacZgEb0TKBLpZR14sx8xkl+Wj9BoixBrhBzXomD6L9jlSxlX3OVS5htvya1unnCMoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZIXITCE2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a89c8db505bso231061666b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2024 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725288556; x=1725893356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSQrcrRl/wp02A0vZtdvQLT9FR6csXZc/MPrC7MM8Pc=;
        b=ZIXITCE2ZaCsEoD7RzdcqsZ0EtaIGXnrb1QHOEdBFFJ718x75RzVvO19cIm8WA+ZWy
         EKB+u6Up2AGE8xipnIfAgmJs4NUmQyZ4kv0ZOOsMsctbG7aJNksr02ATtQd7X8MOOgLv
         L3lMlCwLlg3GmJj2J1mvycCfj/p0I/9U2PTczJtfw5YE12QZaCBuJKowjZY61iW/3HBS
         L5CHqHkbdNrWyXKM7zQI25rBUQvUxVIkRb14YMnV4ZyAcLjy1yfmnxQaAW9YuateGcU1
         +PZZbLfs2QXH9TTBv/+1fysE8klqR/XxH7hPslQg8VJ2pmcoMmJsu7t78fL8WX07AX1P
         lcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725288556; x=1725893356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSQrcrRl/wp02A0vZtdvQLT9FR6csXZc/MPrC7MM8Pc=;
        b=oF2rTEhjVymjOg4hwxswzSfNrhHPxlKthsGkvh+6xQsyhD88kZTKTO7bgjtKDvPTR7
         blUjYb3Hn59DmgkvGIVRHomU350PHzvehF8bQAaDKw3eHSeArfXIHr1Vrgf+v6rpuqua
         fxeC7LQiPNljW2TLogrLwI2kxBMtU/Fktf1mWVpsQ2UKH50xrh3h39uLuupF+55WOXtd
         P3D5d02pLaU6TxorRkq4R0w7TQEVO4+f7c+Ktr5HhM4OuTcHkIm2J0xAWbRLczrUU6En
         CLFjj43gg3uXun4YQsPKvYmUgfWcI3KgoytaibghTmSBZQ1IjoVXbITG4aokdMt6icrK
         E2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVWmIYIpX9abkeFd57ANsSsryR874HACh+wALsyE3FyK28iRedOUfKR3wQt+cgaLQ6q1cqUsEF2vzGELA3WfGxIGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6YavfgqHvZAblDpau5qp/zGKkzyciaQ7cujpguWW2OCI4eMKw
	qn3ODUwGqn4I7eEwxyLHjjEDDA58BsruXrL5rd7kdqvYxypBjuTICjEgUz5eWio=
X-Google-Smtp-Source: AGHT+IGIdweTIHy3ncGoNoDMZ2ce0XHLLrTLA/WGs9kWHo0EafRW0/Aqg+sXCH6Br5tMoRggnn9Gtw==
X-Received: by 2002:a17:907:7da0:b0:a7a:8da1:eb00 with SMTP id a640c23a62f3a-a897f7904d4mr1009653166b.7.1725288556372;
        Mon, 02 Sep 2024 07:49:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196c88sm566746966b.102.2024.09.02.07.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 07:49:15 -0700 (PDT)
Message-ID: <a7f0a36b-3169-45f8-9169-50bb0c6c04dd@tuxon.dev>
Date: Mon, 2 Sep 2024 17:49:14 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 kernel test robot <lkp@intel.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
 <202408302225417622f1e7@mail.local>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <202408302225417622f1e7@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexandre,

On 31.08.2024 01:25, Alexandre Belloni wrote:
> On 30/08/2024 16:02:12+0300, Claudiu wrote:
>> +	priv->rtc_dev->range_min = mktime64(2000, 1, 1, 0, 0, 0);
> 
> RTC_TIMESTAMP_BEGIN_2000

OK

> 
>> +	priv->rtc_dev->range_max = mktime64(2099, 12, 31, 23, 59, 59);
> 
> RTC_TIMESTAMP_END_2099

OK

> 
>> +
>> +	return devm_rtc_register_device(priv->rtc_dev);
>> +}
>> +
>> +static void rtca3_remove(struct platform_device *pdev)
>> +{
>> +	struct rtca3_priv *priv = platform_get_drvdata(pdev);
>> +
>> +	guard(spinlock_irqsave)(&priv->lock);
>> +
>> +	/* Disable alarm, periodic interrupts. */
>> +	rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
> 
> Why do you disable alarms on driver remove? I think you need to add a
> comment if this is because it can't system up, else this is a bad
> practice.

The RTC cannot power on the system after a power off. It can't also resume
it from a deep sleep state (when only the SoC area where the RTC resides
remains power on (there is no way to signal from RTC to the power supply
chain that an alarm happened)). It can only wake it up from s2idle mode
where all SoC components remains powered on.

Also, w/o this change the RTC remains blocked under the following scenarios
if the interrupts are not disabled in remove:

1/ Configure wake alarm and unbind the RTC driver with the following commands:
# echo +10 > /sys/class/rtc/rtc0/wakealarm
# echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > unbind
# sleep 12
# echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > bind

When rebinding the re-configuration of the RTC device times out:
[  121.854190] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
the RTC!
[  121.861511] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
with error -110
-sh: echo: write error: Connection timed out

2/ Configure wake alarm, unbind the RTC driver and switch to s2idle with
the following commands:
# echo s2idle > /sys/power/mem_sleep
# echo +10 > /sys/class/rtc/rtc0/wakealarm
# echo /sys/bus/platform/drivers/rtc-rtca/31004ec00.rtc > unbind
# echo mem > /sys/power/state
# #system is resumed by non RTC wakeup source (as the RTC alarm is not
working anymore in this case)
# echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > bind

The system is not waked up from RTC alarm (as expected) and the rebinding
fails again:

[  172.483688] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
the RTC!
[  172.491003] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
with error -110
-sh: echo: write error: Connection timed out

3/ configure the RTC alarm, unbind and power off (with the following commands):
# echo +60 > /sys/class/rtc/rtc0/wakealarm
# echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > unbind
# poweroff

The system is not started after 60 seconds and at the next reboot the RTC
configuration on probe is failing the same:

[    0.292068] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
the RTC!
[    0.292182] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
with error -110

In all scenarios the RTC is recovered only if removing/re-applying the
power to the SoC area where it resides.

These tests were done with the patches in this series and then I tried it
with the following diff on top of the patches in this series. The results
were the same:

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 822c055b6e4d..720fdac3adc6 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -586,7 +586,7 @@ static int rtca3_initial_setup(struct clk *clk, struct
rtca3_priv *priv)
        usleep_range(sleep_us, sleep_us + 10);

        /* Disable alarm and carry interrupts. */
-       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE;
+       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
        ret = rtca3_alarm_irq_set_helper(priv, mask, 0);
        if (ret)
                return ret;
@@ -784,7 +784,7 @@ static void rtca3_remove(struct platform_device *pdev)
        guard(spinlock_irqsave)(&priv->lock);

        /* Disable alarm, periodic interrupts. */
-       rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
+       //rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
 }

Thank you,
Claudiu Beznea


