Return-Path: <linux-renesas-soc+bounces-27218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI64FwUvcWmcfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:54:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 111585C9FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92E3D82C4F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA7446AEC6;
	Wed, 21 Jan 2026 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ig9WteXB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4644D00B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 17:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015009; cv=none; b=pNlR3WnKElzylon96gv0dzkcvoort8xL6pcy92WaVEqZyaXA+ihnO5/QNqb4hWuhLoWshHUX0Lhm8Oh5JlzCgS2X+8vKJaoGUe0M2fzG1JzOG4Z9l0uNn0vXkmaNSh1WjDQVOxCN72DjMCdkz4ZfHPid/hZD9xrycpVTN0k0AQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015009; c=relaxed/simple;
	bh=UvsEdyt9thVnAqd6eA1QwrZugGr2IQ5O7105Q9OAmSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDu3D4BPgM0pM+n9iHf5rnTZsBXo9Qt5C2lG8TfA63XnGXEkdhTAtujIzWonJI4X64SP+HxPI27S72I6rcED6l0StgDdX09WzQHjWFfsEn5e1DfjMLqQMMppQL5aXXoWoirNg/vgHl4htI4tuGp/Ehx8Jq2cU+PYDd/qTawVvMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ig9WteXB; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso159805e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769015006; x=1769619806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pfs/4OF6mdSfxEvgwVu7e3Rr2mnsLc9qUMIuq21INs8=;
        b=Ig9WteXBIL2eOztbGCnwQdZMIBj65FYIeHPaIIlaUm8Al5Wy2fnllesr0nLd+YU/Jg
         27LMkpVtwHda15FNHj6qJ6M5Iu+Awqzt1npy4oQpjhN/wQOQm8cfKJLiODLAswu9C6Z0
         vs7+0FTXv5j67Z0HZbrNjgoYGj20qrdMG4I919FpbdfqhqLUCy9qGGvDCBCOY+ImH9LK
         gBD4wEWp4cABn5F4Wlt6Z2ivb4uSamA4vzEO4LP8DGTrG4CaOQGEdqOC4B+Nhqd1Oy+V
         ZekNMnuAOGgLKe++/dn1Y0oT0BxF4qEMazkwhzIxPa/6233Vg+lmPtLe53xWajbYSkkL
         eESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015006; x=1769619806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pfs/4OF6mdSfxEvgwVu7e3Rr2mnsLc9qUMIuq21INs8=;
        b=qtyMon63F0VplAxo6kKy7fpNiKtBB7SYu/2cIcC1bmffk/O3aj4ZxxzrtQYKp0oVy9
         7o1Yx2LHONnM9hiBC7Z9a6jvfaFx2c0ro90mu51gQOXONkDAUtulIr3YJdHW9NZFmgCS
         4BB7MhF5jkpvmjeIpJdgD2QniiBpBOG09lO1fzJJG7CXxGfJ6Z7cpuWOwetxG385nwjk
         GHcAaG5IGJXbO/j4MVEcZ0HGmfDU/zy7GR5hDHuzUaO67m3f+hi2ycOAJ7mMbvopgCMZ
         baMa8wSjdlJsWIFRz9yxz8nvYbd8lKqCIjC/8vMWEFbUrn8YQIyNt1D10mRgCklHk6Xr
         0UMg==
X-Forwarded-Encrypted: i=1; AJvYcCXLCPmrIjfO4jvFbBa9Dlli8UC0Goaoyj7x2uckxif1SefqpOc+bRxsqib2TPDIs8TNi3vu2AECMmWuE2+f5awUEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3npBqKKt4YkjIW4nBKNb0txVJVuErgZavGt+Sozb1b+T6GQxN
	dEnSPdtnRZMMUTlaCxLTFuFUJmI0qeUVK4xMc32j26bJw+TY5Z9qjVAxY7FPpG2fEdc=
X-Gm-Gg: AZuq6aKYlsMFDJmlvPzgEDigDDoI6gyJgCT+7e8wbJv20Fg7Pw1oHRlG5gF8yD4no2+
	+NxEtMQGWQZKJ1OzVtw7iLgYbZF+WY3ZFpqsEDh8fB+7oY4eO5TcOvBXp+6pJn0RIjEmC4AETBr
	kzrnQvri+5Z+mITwkWq8HVEZQUiNFM7J5w+yMpW9iCwRXlvxDVPH74vJ/v2Cb6d+imCmklyUzKL
	d1Jhvw0yVf3rNLsYQyLWaHiggDMp5bNHrdtgEviv9Ytgp59CoNQdQY6EKFNaf+vgfeEpNjeXooj
	YSyKKyvrUXQ1ycYmpLBTH8ZTLm5rL7vGwkRPD9spsBye3QepzxrVbb90AfwINX3bI0LzvdCQDe1
	lo9wyGttaX5wCrH9PYF7KaUm7zRjmiOLttYMFCatDIO4OZTuds/pkdmSs8UVHRKm6Oyrw8CS/S1
	z/6VDlRO3b59Qh4jgzsTi4bDO6rch5iGY3vr7ZWWSOG02zmS/G2dVXOec245O/ocnPpYWkw8vuE
	g==
X-Received: by 2002:a05:600c:4e14:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-480470a6bb1mr1607885e9.16.1769015005816;
        Wed, 21 Jan 2026 09:03:25 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ebda:5627:9bc:1ede? ([2a05:6e02:1041:c10:ebda:5627:9bc:1ede])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-480470287c3sm2222605e9.3.2026.01.21.09.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:03:25 -0800 (PST)
Message-ID: <c7e418fd-d330-4fa7-a6c1-ec1401ebc0c0@linaro.org>
Date: Wed, 21 Jan 2026 18:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: thermal: r9a09g047-tsu: Document RZ/V2N
 TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 john.madieu.xa@bp.renesas.com, rafael@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com>
 <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27218-lists,linux-renesas-soc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,bp.renesas.com,kernel.org,intel.com,arm.com,glider.be,gmail.com,baylibre.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[17];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[twitter.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 111585C9FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/9/25 10:11, Ovidiu Panait wrote:
> The Renesas RZ/V2N SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing.
> 
> The Renesas RZ/V2N SoC is using the same TSU IP found on the RZ/G3E SoC,
> the only difference being that it has two channels instead of one.
> 
> Add new compatible string "renesas,r9a09g056-tsu" for RZ/V2N and use
> "renesas,r9a09g047-tsu" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---

Applied, 1/3

Thanks
   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

