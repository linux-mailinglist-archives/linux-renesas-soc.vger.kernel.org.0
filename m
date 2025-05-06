Return-Path: <linux-renesas-soc+bounces-16710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2CAAC1C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEEA97AE9A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA20277817;
	Tue,  6 May 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t307A4Tw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E920C028
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 May 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528739; cv=none; b=UwtHR0Flt88AiIRMG+eFlYa4BbTUV1hWUl+tOcwVcRf3yF+oWUHkgHUDzj4RtPPX6DyBF8wPL+Fpv+3rn193CTcEGsq12eXgCWgKjiweLbaKnbwZm6p1NB23czfH8Vo798cIczM6WQ3RJkpF8C2PHNZKDnzQRDJjthqachIsgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528739; c=relaxed/simple;
	bh=LdcTZ1d3zrApl9FJ/dU20RsasAiXDH6rOUrl3yUMVZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sy62SbZLWvc34CQ+YVWW1BYBlerAlmbK/73X/Fn8fudqN4VXB8ymU1JAoOJ9Y5oTrPKdgnLgZxx6QhApgqZE9022Riks+pRYMz+DeiEzjrO4aeI8i4snUKrUDcJ/PCZBBcYUqUQL9wRnm5Hc81gSngkyygIbeN0vSr1ZMjvMkMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t307A4Tw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39d73b97500so267092f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 May 2025 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746528735; x=1747133535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCQGBPsfO5vWFkl0A0zD/MgOqOEpO+/052K/NE4TDl0=;
        b=t307A4Tw6uXqCylZRmdpJgsgmAescxrpL9rymZoYr+LajDTroYzuxykMhX4+Hl9NLk
         6ENwyP3GYqWZY5R4vcrw8zo7wZGSr/CvKxNrCIsx9Zz1+ZWYKt0aAsGx5CXmre6mlrYF
         UPN/o88diO15Ytv9YHWxeHdEXM6U3MM4gnL9ns5xlRO57+FcigZttqqyQ+hegr57iqIY
         w8sFCDto/DJwORWlzXlVoxo9cCiyXKl5guZU10kpGoxDuGQEnZHzo0zh52EHWbEqXeBq
         Ig8saV6j4HI68VLRANZcLi8C1W+LAxH8WGstAQPZ5cfhavTWQcnvLBvciOYosPKFMead
         xDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528735; x=1747133535;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCQGBPsfO5vWFkl0A0zD/MgOqOEpO+/052K/NE4TDl0=;
        b=FGgRh9tEL3ngeGwTS68MlFFYP/39VEF6y5UybLsUfvSM4MAqe2r2x3xBM0UyBcRR07
         b6yToqDYjknyJ7t0QySlZta8WUux/z71uOcvHMthWo6V5nGkIXDs/6Skkko5UsqRNBLo
         c31U/R288X1aeqokEyhsHeQFlp3RfL3iInTvty1wFsR8i1IH/RwXuk54Kvc86RfUeqee
         wbl71ZslFy7kNK86zxXzBcOkiXNWEmrBjgW5ebyXEwPCrO+L4320Jp0oX8Wgshs3sxD4
         kAEEnCv8ZQs8CJb85pXdkKvOu+EwvNtpY6jROFco4KIT9QqQCPUUTAuJfax6qFX+oKbL
         lyaw==
X-Forwarded-Encrypted: i=1; AJvYcCXewlTHv9GdaGX3yct4u/qfzrsGn/rV3CrGl2YsJMvJDVVVNJNxWynxkFTfhJf+y2vChfQc1YJA6FgQv+N3PS42ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8VewTaWzk08ZBTCLOqIxuNw9h96iYP0833+ODr2x3DuGCTi8l
	h7K15RB2b1kcxUd09t5fQ4U2j1FrhC4EIi+sJHzt7HxpfKaYiX26y/LPAtcR4zo=
X-Gm-Gg: ASbGncvyejCXP6ZelHjM8yvz8LKZCbVf05BQaeRHS4NLEmYEry6ATYOD1PKFhEZUuWk
	xyYyRE3lggJ2PD/7A6RmUAIYZQTsKSTbryRUapxT2k7tSebnusKJvSJOSXLwVyZu8kchXLURTF0
	nxmpeFkayYIen+usA+P5Z0mZNyvbl2qmuXOQe+ycuEwAaXJr82R/xCYe0LAC0g+jstKM43jwDVE
	iMJX5Z6DP2dIyEYPpctINS1u615p0YgvennqkMfEeYfAgyJVvzvZT/BljuM/ED0sGZBSVXP2IBm
	Cof3vMBJNp63dbb3HkiEUxeJ3/Ne4542YSaNim9+KsvtqSlUkqe5YjABXZY=
X-Google-Smtp-Source: AGHT+IG+AWKFdW1c3BWzDe6zKGQh1cg2/RqGRVWCUYPzqFEaMQKAz07sa0MgSDalD2L/4cnUy4wIWA==
X-Received: by 2002:a5d:5f87:0:b0:39c:2663:6c23 with SMTP id ffacd0b85a97d-3a099adf5e6mr4448569f8f.9.1746528734779;
        Tue, 06 May 2025 03:52:14 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b170b8sm12995727f8f.82.2025.05.06.03.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:52:14 -0700 (PDT)
Message-ID: <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
Date: Tue, 6 May 2025 12:52:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 12:47, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> ensure the Ethernet driver is available early in the boot process. This
> is necessary for platforms mounting the root filesystem via NFS, as the
> driver must be available before the root filesystem is accessed.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Same comments as for previous patches like this (even the same?): you
are supposed to use initramfs for your arm74 boards. Even armv7 boards
use initramfs, so network driver does not have to be built in.

For example all of our setups use it thus we do not have to populate all
other vendors with our own drivers.

Sorry, but I am strongly against such change. Kernel is already way too
big and with KASAN it does not fit to boot partitions in some of the
devices (and I cannot change the boot partition size, at least not
without big effort).


Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

