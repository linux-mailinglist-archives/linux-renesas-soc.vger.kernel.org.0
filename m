Return-Path: <linux-renesas-soc+bounces-24734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6AC6A2FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 16:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id DABD52B124
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC83357A2A;
	Tue, 18 Nov 2025 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BY5nwgAk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219D31064E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478225; cv=none; b=fSBrRyyMlQ47BJ9ZW8b5iO9ww1yrprghzyNrq4bpKHV98RyhpzGvHSEWl+TvRbLs92B1Gym2kQpNVIyzn+cVTzMPqDDUbyM/wZX8Rj9uJ0WF/5L0+RIo5RKWgKWX/gZgIu7CkgrsIJWdtrtiAhP1nJpXxLsj8q1+gj3EHFZk9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478225; c=relaxed/simple;
	bh=E2UPMhSVc7lP9k06c8+dP+g+rlxEfJ8E1Ck+w9qG2n4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dnJ6hZGZjdoZwPjk4CIYZxuG7ArVXpe19GNAJEGvZzBe8ON/elgDBqb2Jv5eRUD3Lm/fceCH6moXZGpGq5DvVEkDDnbSUY9R4KoCPs6AbMGAwbYjqHpnMkz5JSRtHqF7O1XjGva26zWq4TreXMiawuQRDUoUgnvSfIlE5TQfAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BY5nwgAk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso46708025e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763478221; x=1764083021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8WV+lVIvrjo7rZmjE+gswziL7WbppYyzdAivTHQVq0=;
        b=BY5nwgAk1YA9mF0XdQxQ3iFdtnX7qGBMpm66ol1FaltUsiqvzraLOG19ADW82Qy0nP
         9LqnIeDqDQSLXIbQjsaNVKEWApDMFFvhFdlMXVjeBpBkZJZ9jRUddi96vpP2C2lPTAP0
         L8h3tvAWznobQBVYt7HnPDjPRnrmd+qoHDj2deg5m0ARq7sVEMNmKJsf1UFYlu58ka91
         wfKOfO4noupSiSk3UEqO34/NDyYYVyY2PvL5CgUQ4HNzKicW2TJAH2DFOEtZP4Fwgxxo
         fx8VP/nuLkYjzwlzedZwNxBS+B48oj9PsxmcGcQqb/vmAmoipn8F+6NSWEdgxAugA0uy
         CgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478221; x=1764083021;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8WV+lVIvrjo7rZmjE+gswziL7WbppYyzdAivTHQVq0=;
        b=ohFxdxQwloGZ+Ho8gGduvoj6MlFrWryll0ekbmoVl4ePJaW/O/SebfUXcodclui1fg
         5mL2/om+hCgmz9V1AIDIBZQF0nr5vvk2b4+Na4g3JPlm9op4qeZJ3iPfhv11VVASgngX
         IO8HxseG5mtl3cfZp6Kw8K8cUJ9GkN5/BQ8TsDPCS9FXG+aONx3QKZIicGHU3twC+ysZ
         yf02tL+gwHuoGUhbIK85B1hSkWiw1J9ymV/8kdB7ThHJsP2twEb7XxVTzc1DqGz3YPC7
         0dKzpvwH0HCxf3715jbVbYKuWzvKt8KyO1RKFVMNZh5UBvPuns+Vf6WOH9UBYD2Ct7ay
         cWxQ==
X-Gm-Message-State: AOJu0YzQSwhgEc90kuVTvROJZ76RTQJwrqMgwXzhjT1TFOOcSaRNztG9
	xfxRTVBOAvHG7qOzb2F5GnzfJcHT9HEka/LPQtbI3PuPUwUN7YoD4Y5h0wseYkasYu4=
X-Gm-Gg: ASbGnctuW8GiXyXK9XPs7KdAPRGQGMt4H2/27n3GYNFB7DlnB4pdXOCR4yiDvYlk2I2
	cub23fZxIU7km/fgqvtgoA8SMXkeEPeRLLXiITmembU1LP5h2NR1+lTq2sIaaGVfCdRWGUHTFo0
	t071tEjSqyb+8sY7IHEF9T1I8wBGr+3h+uTBd/n+O6pXppG/r8SRJ+7i33IHe/SdYPSbm3vKHTk
	RP1uztfarzPvw6/X3XQHkp0y6u51vl3JCPmo4CMrLRF5eCidvLfzxdgh5fZio9x8fzf+N6rbK13
	FX5pnIctUnj3DJqJG97/W53iL0ML7tbl+7V27NXAH0BnoU3tB48XR+PvTbwJegDoBhLhiAb1a4Q
	rrQe3xP78k2gljjG1rxFyLghVfqfu+++J+ySCd3bPO+BgtOBH/hBrcf8cvKqHjsRiMXF2RFAHgs
	d1zr+MCQ3oD1ecW4a4J+hlEMvyVRPtbkerBdzBbqhQjX5cZfz1WNj2h59Q7OfYztSXTxAnzJze6
	w==
X-Google-Smtp-Source: AGHT+IEetwF3Ns90esL57qVwnG2Jl6XJFWtUfNJDvD/LIHAt+CrVEPkL7/d2f7BaOrYGKuhrh7at7Q==
X-Received: by 2002:a05:600c:3208:b0:477:14ba:28da with SMTP id 5b1f17b1804b1-477ae88dabfmr10448415e9.5.1763478221075;
        Tue, 18 Nov 2025 07:03:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e43c2fsm351648875e9.6.2025.11.18.07.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:03:40 -0800 (PST)
Message-ID: <ab085051-27fd-415c-83b4-5ca087bdb0c8@linaro.org>
Date: Tue, 18 Nov 2025 16:03:39 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Add suspend/resume support
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251106144148.3051962-1-claudiu.beznea.uj@bp.renesas.com>
 <4d486bd8-9e87-4bf2-a96f-38aa0f701c45@linaro.org>
 <047df95e-b1b6-4e7b-89f7-d7cb69559a49@tuxon.dev>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <047df95e-b1b6-4e7b-89f7-d7cb69559a49@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/18/25 15:13, Claudiu Beznea wrote:
> Hi, Neil,
> 
> On 11/18/25 15:54, Neil Armstrong wrote:
>> On 11/6/25 15:41, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S supports a power saving mode where power to most of the
>>> SoC components is turned off. The USB PHY is among these components.
>>> Because of this the settings applied in driver probe need to be executed
>>> also on resume path. On suspend path only reset signal need to be asserted.
>>> Add suspend/resume support.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> ---
>>>
>>> This patch is built on top of patches 1/7, 2/7 at [1]
>>>
>>> [1] https://lore.kernel.org/all/20251023135810.1688415-2-
>>> claudiu.beznea.uj@bp.renesas.com
>>>
>>>    drivers/phy/renesas/phy-rcar-gen3-usb2.c | 66 +++++++++++++++++-------
>>>    1 file changed, 47 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/
>>> renesas/phy-rcar-gen3-usb2.c
>>> index a38ead7c8055..3c063e4dea41 100644
>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> @@ -132,6 +132,7 @@ struct rcar_gen3_chan {
>>>        struct device *dev;    /* platform_device's device */
>>>        const struct rcar_gen3_phy_drv_data *phy_data;
>>>        struct extcon_dev *extcon;
>>> +    struct reset_control *rstc;
>>>        struct rcar_gen3_phy rphys[NUM_OF_PHYS];
>>>        struct regulator *vbus;
>>>        struct work_struct work;
>>> @@ -778,35 +779,24 @@ static void rcar_gen3_reset_assert(void *data)
>>>    static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>>>    {
>>>        struct device *dev = channel->dev;
>>> -    struct reset_control *rstc;
>>>        int ret;
>>>        u32 val;
>>>    -    rstc = devm_reset_control_array_get_shared(dev);
>>> -    if (IS_ERR(rstc))
>>> -        return PTR_ERR(rstc);
>>> +    if (!channel->phy_data->init_bus)
>>> +        return 0;
>>>          ret = pm_runtime_resume_and_get(dev);
>>>        if (ret)
>>>            return ret;
>>>    -    ret = reset_control_deassert(rstc);
>>> -    if (ret)
>>> -        goto rpm_put;
>>> -
>>> -    ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, rstc);
>>> -    if (ret)
>>> -        goto rpm_put;
>>> -
>>>        val = readl(channel->base + USB2_AHB_BUS_CTR);
>>>        val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
>>>        val |= USB2_AHB_BUS_CTR_MBL_INCR4;
>>>        writel(val, channel->base + USB2_AHB_BUS_CTR);
>>>    -rpm_put:
>>>        pm_runtime_put(dev);
>>>    -    return ret;
>>> +    return 0;
>>>    }
>>>      static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>> @@ -846,6 +836,18 @@ static int rcar_gen3_phy_usb2_probe(struct
>>> platform_device *pdev)
>>>            }
>>>        }
>>>    +    channel->rstc = devm_reset_control_array_get_optional_shared(dev);
>>> +    if (IS_ERR(channel->rstc))
>>> +        return PTR_ERR(channel->rstc);
>>> +
>>> +    ret = reset_control_deassert(channel->rstc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, channel-
>>>> rstc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>        /*
>>>         * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>>>         * And then, phy-core will manage runtime pm for this device.
>>> @@ -861,11 +863,9 @@ static int rcar_gen3_phy_usb2_probe(struct
>>> platform_device *pdev)
>>>        platform_set_drvdata(pdev, channel);
>>>        channel->dev = dev;
>>>    -    if (channel->phy_data->init_bus) {
>>> -        ret = rcar_gen3_phy_usb2_init_bus(channel);
>>> -        if (ret)
>>> -            goto error;
>>> -    }
>>
>> I don't see why you changed the logic of calling
>> rcar_gen3_phy_usb2_init_bus(),
>> moving the reset setup and handling should be enough, no ?
>>
> Sorry, I missed to mention it. I did it like this just to avoid this pattern:
> 
> 	if (channel->phy_data->init_bus) {
> 		ret = rcar_gen3_phy_usb2_init_bus(channel);
> 		if (ret)
> 			return ret;
> 	}
> 
> in both probe and resume path. The channel->phy_data->init_bus check is not
> embedded in rcar_gen3_phy_usb2_init_bus(). Please let me know if you want
> me to revert it.

It's an unrelated change, so I think it should be moved to a separate cleanup patch.

Thanks,
Neil


> 
> Thank you,
> Claudiu


