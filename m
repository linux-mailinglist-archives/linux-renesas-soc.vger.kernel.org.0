Return-Path: <linux-renesas-soc+bounces-24034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97857C2CEBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 16:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FD8342804B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE0A315D45;
	Mon,  3 Nov 2025 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0z4+U20"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB663148BE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182528; cv=none; b=Tcz6nei45KBNek7su0rzCaagy8BI1iDbp1NmIyCqWeZPi7OoUNC8CblvDhz8HGyAaTzPAd/Wvi/A+pAm76rwHkHS+GDgpSDCO5weA0nmI98Jh7Md4CCdukpQK4xuCIeE75k8FGju/PjcT4NQfvsSzgCOvQsA6eZATnFSS4pU9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182528; c=relaxed/simple;
	bh=6WUxV/Y3QF9G9L0fnxB34hjYzjxWTRTiCavgyeY+AdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfxstS59Aqi8z2laBDDvUX3rCcfkdHE3ilYROi7X3WxBZm/+ekXNIXYSHtv7aCn4kz7//GMn/HhGquUKzCVf4cOE/qvYY7KSJFgUh2WmfyPSkfDG+SJp/9eZgTeWqD9mNcIhActy3bUyTRuhPysD9YZv1hmKcMnDkW1f8r+TZ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0z4+U20; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63c0b633c7cso929318a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762182525; x=1762787325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/jZqQix9VRtxtKfMuzIZFEmI4hpkeByCEuHM+D7e5k=;
        b=w0z4+U20X4Pp5JPjzEcw+/+Csb+98MMGuU4iOERdylADBdrUCEYTU78eFZB21ozBiw
         U9TjcZgAqY43CGulHP9psG9Ffwfp+MctWl1WtMfeHtN1mcSY7qNrOsCRdfwbZeGjOOcb
         IVt1nOcN3QRIdP5BlOv8P7depf2k4a/jH/potr+1Nob7gSA6OPZ7kr7OF4ihBlLXOesm
         Skx7uEMYKgktEburKPjzuSBTFPznjK0tkc2EOis9hXn4W4fsJvUx2Vt+dVjH0XTHFxUZ
         ZK+1RPxQOukgFtNtoge3qewb8GqREnSLkuYxnz1stLlOOZGSWzlnRA7fa+C/Ra6HDSq0
         +jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762182525; x=1762787325;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/jZqQix9VRtxtKfMuzIZFEmI4hpkeByCEuHM+D7e5k=;
        b=AygZFZcLNTzvkFwYI2x7mj4PBYPqlxSCITEldgM6MSF3723cDV+KQ5rVcOTq0o6bxf
         dtDik7Da7WtUydThhddM/TIbcMPxFiIpT2omkBZIuzBT+Rt7Pfx/YdNuVFCdIbKyhiWV
         mecUMGkLX/5spiG4Rr7yQ+2wb3w8iWwixp4Wrgs/k9cuGXfv6Ibv6dLPfw6RtyM5pFey
         haLcdue16O0b9+QPM11jkM/STTabxHWzJVb11tbDWE1Sr31JKhBULBepZdfvV/VIz3RZ
         vCoaAxbY9OM/zZF2ZUUeRzU23BdzWTablHq8FF91oemucvfw9r1zs/6OuCQW7Ltap3GW
         tGMw==
X-Gm-Message-State: AOJu0YxTy4CuWptyEkF6xXT1cxkuNkuRUmqmJsNtrfVgQlvtbfSuTHB9
	YV8mfF4vRljy6z0lXd+Gkj+0freVD3ptFfFcGi0/+PSLgZ4SIlVUnjqYkxiUgovLjSA=
X-Gm-Gg: ASbGncs7mM/u9IslpKtJM1bTAulZH7emZ6n0ZNhbZH/MiM9eWo3tbupp1Zf2jh7BmQ+
	PVrbatYjgvQ5RlYJ9X76ziImT4eEs+BmRLPGqx5OoWHYGg24Ks08BDAFvk8MG8k84+Q+q0ATXc9
	dN91cwp2StAqXk6sQXW6NC0ddvfjQAtewgEbDc7cMGQ9INYo/6NVj2+0V3lU9MfE2hs74RYAPvX
	t9dqWLoZy3P4Z058K8VHyCqI0tVQGXfdQM5rbrPGbzVg73N3On4uDbfB83srCSFHzTmuJTYYLMe
	2oNK20ti7yqQGbe4C0DCDhotaNzyKibt0wkYkbl6/pwUNoptRhpP7pNdLmW/Sh/dKD5HuhKtIK4
	Du0M0/ImJ6IadghfmONltkoyQKYflqONPN6kUAsC9ukcWmbL3+jhejzic+gm+rv8N4jPH2LRsKu
	hHLkAWOr2ddTn09hr+5yTE
X-Google-Smtp-Source: AGHT+IGb+RwPOBqL429ahEH9nMmdkpa19V3x0i1lFs7UcNKotOpEosqy1DxPBQaT7+8mqvq+PFnokQ==
X-Received: by 2002:a17:906:e17:b0:b70:e685:5ac8 with SMTP id a640c23a62f3a-b70e68592a2mr154033066b.3.1762182525238;
        Mon, 03 Nov 2025 07:08:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70acf84c51sm542320566b.30.2025.11.03.07.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:08:44 -0800 (PST)
Message-ID: <61c8e3fc-af35-432f-9bb9-300c953819e4@linaro.org>
Date: Mon, 3 Nov 2025 16:08:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] reset: handle RESET_GPIO better to provide the
 fallback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <874irz3e8m.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <874irz3e8m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/10/2025 02:02, Kuninori Morimoto wrote:
> 
> Hi Wolfram
> 
>> After the discussion[1] (Thanks, Philipp!), here is the updated series.
>> Details are in the commit messages. Please let me know what you think.
> 
> Thank you for your help !!
> My board started works again (without .config manual update !)
> 
> Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Started to work? So was it broken? By what?

This driver was always OPTIONAL, was never meant to be required and
there was no code which was converted to usage of this driver.

I have doubts how this was tested - what exactly problem is being here
solved (except breaking all possible platforms by making this
non-bisectable...).

Best regards,
Krzysztof

