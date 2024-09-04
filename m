Return-Path: <linux-renesas-soc+bounces-8666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D596A3AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 18:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E7B287565
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 16:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F6A189BB7;
	Tue,  3 Sep 2024 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mbK6qNV4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7A189532
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 16:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379747; cv=none; b=YIvCGFubJxankmmj2+/rrGNbh9L3CKdDLSsnPKGnXM3i4KJgBMDAuQ4jjAQEIRxI2VtAsZM/LTl8+C+9lXZyWpn+Mw462Gqko2SiGei4MAYn8NrMcMroyS9+gw/HKaxYcGg0M5Nzb/gkP7TTZRDbUzFjD8lgNCTlgAY15RFhysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379747; c=relaxed/simple;
	bh=y5SL93VBSG2PaFcIjScLBdkpp7+Kda8Df14EgSpWRn0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=knTB+jLvMqBd46NfV2nqGgAxC2Z7c7WT1WVtuW+7wa7vauh3mdsk60BRTREcnlHLDoPy+5JxTJrn+wWBzw82vWEMBu7OiPxCcTE8fSC8iiFIGMHkmyczuJtAh9xSSpdzTVWla2Y3T8igQ0N3OlGBRG0/Ql2O38dwOmUwqzDcFT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mbK6qNV4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-534366c194fso5071904e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 09:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725379743; x=1725984543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8l/509FpNkymjZk6uQDQhCFKV86rdSFlJhhBluR1lWQ=;
        b=mbK6qNV4Fi9dqEktBv1jzHT0Mnt0m0mWZTCV1q0uqJpV5Nfuxkm03fVg2NukbcEkgo
         Ryqsph6TqgcGAJYnwaUgsaFTusB/2a/wgzLMiVo6LobZOGhov+X0Rvn4k/WzqLsFv6lx
         +HW+fs96QRi3+AuFsADiiXZYyKLE+fHQsFickhgG45QywOFlgfvzRJ0OkcSsCo/PuTWd
         GY0CT02kV/Sj1hRqWau/JCjgHQE3l1FEZYLRMH7FRhcpRYF7CV5/t4hACP3RF1JvbI+G
         dtBxWIFph5o8qzQf7WoZZFWmaE9hFTo4bJiDcDcblEQyDJ1uhCAK+sBx0p0fsy4CllxT
         dSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725379743; x=1725984543;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8l/509FpNkymjZk6uQDQhCFKV86rdSFlJhhBluR1lWQ=;
        b=vhU/e2BMwmVTtrL0+5att3MSrki+NXDLqSxLSbDLfhoqvydj+jf8snFUEfrivI15jr
         L+UV4ejxCvkRY10vd2H7r472zNPZaCkLMD7139av7dyzAfSmUdUsXxVG5f6JlBECvquL
         t29tY9Rc7UskegieIfQwZIBi7kOBEZFhvyBICpEQvaQz0XxoiIpaHpT80CUqbQZDQYXZ
         Q2Pp3fuoBGOrv9MBsIdIar+O9ZX9Ky/bx+XZxJjSqwkZkTrLiWT6bNKCy9h4OuMlfaWM
         YSaxImpLiGRw51tuiG5NuHGT05MwxtSoAwoio41A74FvxjqVsmvHzdruoggt5ZOwjD4H
         6psg==
X-Forwarded-Encrypted: i=1; AJvYcCUiypCDcq4pXtdIVPKt/K9nLFqxHgS3oxbd+eJm3RVSJDOVjy2lQDTWyhI0p2vg3v5AGlEcEq0LzntzdQC/vsJWUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXMDsQ7Fynb5LElRs6h+u8bqPn2UfeJbccpDmIatIm9Vrd/d3
	6fubf1OEoMK+ZdMCds9yXKmKcx/ALzIlD/g/eDQZ7Dmll7euWI+eHJhIJMMI2wk=
X-Google-Smtp-Source: AGHT+IHRgADNb3niI6r59DDvi2vKw+KXHb9j7aF21MTBrDxSrH2/p6N4jk8lRMTOk+xwkvlxmsucsA==
X-Received: by 2002:a05:6512:b98:b0:52f:2adf:d445 with SMTP id 2adb3069b0e04-53546baacdbmr10597606e87.41.1725379743051;
        Tue, 03 Sep 2024 09:09:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898919686bsm693150066b.134.2024.09.03.09.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 09:09:02 -0700 (PDT)
Message-ID: <2e49b73c-c645-446c-8606-7a531e0a74f8@tuxon.dev>
Date: Tue, 3 Sep 2024 19:09:00 +0300
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
From: claudiu beznea <claudiu.beznea@tuxon.dev>
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
 <a7f0a36b-3169-45f8-9169-50bb0c6c04dd@tuxon.dev>
In-Reply-To: <a7f0a36b-3169-45f8-9169-50bb0c6c04dd@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexandre,

On 02.09.2024 17:49, claudiu beznea wrote:
> Hi, Alexandre,
> 
> On 31.08.2024 01:25, Alexandre Belloni wrote:
>> On 30/08/2024 16:02:12+0300, Claudiu wrote:
>>> +	priv->rtc_dev->range_min = mktime64(2000, 1, 1, 0, 0, 0);
>>
>> RTC_TIMESTAMP_BEGIN_2000
> 
> OK
> 
>>
>>> +	priv->rtc_dev->range_max = mktime64(2099, 12, 31, 23, 59, 59);
>>
>> RTC_TIMESTAMP_END_2099
> 
> OK
> 
>>
>>> +
>>> +	return devm_rtc_register_device(priv->rtc_dev);
>>> +}
>>> +
>>> +static void rtca3_remove(struct platform_device *pdev)
>>> +{
>>> +	struct rtca3_priv *priv = platform_get_drvdata(pdev);
>>> +
>>> +	guard(spinlock_irqsave)(&priv->lock);
>>> +
>>> +	/* Disable alarm, periodic interrupts. */
>>> +	rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
>>
>> Why do you disable alarms on driver remove? I think you need to add a
>> comment if this is because it can't system up, else this is a bad
>> practice.
> 
> The RTC cannot power on the system after a power off. It can't also resume
> it from a deep sleep state (when only the SoC area where the RTC resides
> remains power on (there is no way to signal from RTC to the power supply
> chain that an alarm happened)). It can only wake it up from s2idle mode
> where all SoC components remains powered on.

FTR, this is still valid.

> 
> Also, w/o this change the RTC remains blocked under the following scenarios
> if the interrupts are not disabled in remove:

This intrigued me and did some further investigation. I found that
something is wrong on the driver as described bellow.

The failures described in the previous emails were due to the fact that the
RTC counter clock was requested by the driver as devres managed resource.
This is the clock that feeds the RTC counting logic.

With the bellow diff applied on top of this series scenarios 1/ and 2/
described in the previous email works just fine.

For scenario 3/ the system is not powered up (as expected) but there are no
more failures on the next boots.

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index f908d2a1017d..c9adcadc58c0 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -747,10 +747,14 @@ static int rtca3_probe(struct platform_device *pdev)
        if (ret)
                return ret;

-       clk = devm_clk_get_enabled(dev, "counter");
+       clk = devm_clk_get(dev, "counter");
        if (IS_ERR(clk))
                return PTR_ERR(clk);

+       ret = clk_prepare_enable(clk);
+       if (ret)
+               return ret;
+
        spin_lock_init(&priv->lock);
        atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
        init_completion(&priv->set_alarm_completion);
@@ -783,7 +787,7 @@ static void rtca3_remove(struct platform_device *pdev)

        guard(spinlock_irqsave)(&priv->lock);

-       rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
+       //rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
 }

Question is: the RTC counter clock should stay on when the driver is
unbinded, right?

Thank you,
Claudiu Beznea

> 
> 1/ Configure wake alarm and unbind the RTC driver with the following commands:
> # echo +10 > /sys/class/rtc/rtc0/wakealarm
> # echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > unbind
> # sleep 12
> # echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > bind
> 
> When rebinding the re-configuration of the RTC device times out:
> [  121.854190] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> the RTC!
> [  121.861511] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> with error -110
> -sh: echo: write error: Connection timed out
> 
> 2/ Configure wake alarm, unbind the RTC driver and switch to s2idle with
> the following commands:
> # echo s2idle > /sys/power/mem_sleep
> # echo +10 > /sys/class/rtc/rtc0/wakealarm
> # echo /sys/bus/platform/drivers/rtc-rtca/31004ec00.rtc > unbind
> # echo mem > /sys/power/state
> # #system is resumed by non RTC wakeup source (as the RTC alarm is not
> working anymore in this case)
> # echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > bind
> 
> The system is not waked up from RTC alarm (as expected) and the rebinding
> fails again:
> 
> [  172.483688] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> the RTC!
> [  172.491003] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> with error -110
> -sh: echo: write error: Connection timed out
> 
> 3/ configure the RTC alarm, unbind and power off (with the following commands):
> # echo +60 > /sys/class/rtc/rtc0/wakealarm
> # echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > unbind
> # poweroff
> 
> The system is not started after 60 seconds and at the next reboot the RTC
> configuration on probe is failing the same:
> 
> [    0.292068] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> the RTC!
> [    0.292182] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> with error -110
> 
> In all scenarios the RTC is recovered only if removing/re-applying the
> power to the SoC area where it resides.
> 
> These tests were done with the patches in this series and then I tried it
> with the following diff on top of the patches in this series. The results
> were the same:
> 
> diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
> index 822c055b6e4d..720fdac3adc6 100644
> --- a/drivers/rtc/rtc-renesas-rtca3.c
> +++ b/drivers/rtc/rtc-renesas-rtca3.c
> @@ -586,7 +586,7 @@ static int rtca3_initial_setup(struct clk *clk, struct
> rtca3_priv *priv)
>         usleep_range(sleep_us, sleep_us + 10);
> 
>         /* Disable alarm and carry interrupts. */
> -       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE;
> +       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
>         ret = rtca3_alarm_irq_set_helper(priv, mask, 0);
>         if (ret)
>                 return ret;
> @@ -784,7 +784,7 @@ static void rtca3_remove(struct platform_device *pdev)
>         guard(spinlock_irqsave)(&priv->lock);
> 
>         /* Disable alarm, periodic interrupts. */
> -       rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
> +       //rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
>  }
> 
> Thank you,
> Claudiu Beznea
> 

