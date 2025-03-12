Return-Path: <linux-renesas-soc+bounces-14315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D7BA5E169
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 17:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51EFA16914E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Mar 2025 16:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D331AF4E9;
	Wed, 12 Mar 2025 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="boVJ9VfV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9808E19C54B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Mar 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741795593; cv=none; b=KMdSo4Il7oOR8p5cAcxKoX8V+9CxKl+1zYb0lYF/p0/ApVEgDduWY7b6hdSq0hq8K8iiefY0Smw3c0Bx15IrYJEG3VK3dCG+1w0oX/eVp/Z/xPyWdjC+c5o1ukWHNMjHWbGSsWzuh2rnK0DYnOPzqJBgDlU5UAJ46ux+b4KnaO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741795593; c=relaxed/simple;
	bh=nmo8fdXV2sIpmS5UmT2CDlZRiYH6e9W1wePfJpe9bQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EnHnScFaqD6V2OXIwu3NUJeChH6Xlb0ABiiAXjP57JI+HXgQ6H/C8Z7mKneH2UXpwM1m5S2cD4e7zusq4BTSFplGwrdt2pJLwkrTmtHfjaaqnldWRUr43ktGuruVUwOZYmzM/2+OzJYVO99bgrpWvs8Lkv42ezRz0P3lA8iOIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=boVJ9VfV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3914a5def6bso11342f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Mar 2025 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741795590; x=1742400390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YK3oQqTUtAqfGd/88d2ovA0EBim6Stx5RfHYpnVTCQ=;
        b=boVJ9VfVpEJZgLL086LpZsrEZhmK9n1+E8TpCP9/sOlagwkHgZgKvm8RrvScTaoBLZ
         wCmlcZr4xnJTp+ORcQVXZ8cII2DFSkW11KtO6KPrL3x3cPlrF/pJz3+33B+XX+KHIZ9y
         5tvVw8vLKPvftshVaK/D9Ipw2UBeBIC6FPcji//M1lUP5h3lXGJnz0a5cPHp8mhXrzvD
         GRFALkOLBNGoYzMSKNlc8kLOXA2xv3Jsw3uLngoxs+qUeS0u+mvQb1toSrUrmnb+OxvF
         Y4YlzSJXDZ/A5rnHO7Qo789w34CXMP1r+0j7RWK73xlGw1aPcDXBk3mb3Uh6De+tZYAN
         vIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741795590; x=1742400390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YK3oQqTUtAqfGd/88d2ovA0EBim6Stx5RfHYpnVTCQ=;
        b=WPEadu60OgpZqdqQWKEJ4njsOQrVkrIgyYI3t/U5DCqtwNtsNhAKyefhFGrBHrzVdN
         ogqkKqVAaMcIInosf6d/YaXjP46RnFU9vVrGe7kNqjKlCYsPHht3Fa33R8muvajE1CUn
         9tLcswIqJzzhMHduz/fPJaAcs43fAWAk//geErBGiXGgVTdkN15vgreFWUPcdPoN0aBu
         JsvMTiMUbJ1kkqQT2X6HIob86kaRV0L0KbEu5pcN4yfVJJoFAKGWrmXI+1pKn+K1/HcY
         XSY4eGodE4Oz5xHmDKQFuGdScKZgxtezkNwo/XxYVR1JYwluEKZcZCcO8sGVXVvVWQrR
         PJjw==
X-Forwarded-Encrypted: i=1; AJvYcCV6SfIQG0vzT2gIH09wk3l/zgS/du2wBv3VVngV8PkpWTBb/Zawo2tBkGkSfeEVhRFeVgkPkgmaMHxkhnISvbNGrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZL8I+87M+4cwBotKhTOG/5lvMPk70EZG2rX4b/VB+RLGxSqRH
	ojSEKC+pWX0hWvP0z9eFuj7/c8komsN9KkHogV5Z3kjjkngkFB55ctsKKOZe9i4=
X-Gm-Gg: ASbGncv9jC7VlQumrS2qoAFhsSO5hySOzv5wH4jffIpsoAImMNQ0Vzbu0bK+bmH9S8o
	hKPwIbvY+ntKjJcOuAgDyoy6hTQ45+/oOp1PVKyHRbC+r3ENZ/1AOoiyM/0X84I/5DlUuZ/dbFn
	QA/c9gasLkNP3TzYDUt6QHu7ZdQPGFJQ4K3gkAdGwGlf+K8PmaVkdz7gt7PHX22KKLF0MNC9R14
	5vf+wZrpF+CdPcdALPX5qdmSIox/b/EXgGAPuSsAD/+6qwfxNKKalE/yCGdt9eSmoNvmRlal9Lv
	PuQ5DZgehZ702VoOTReilEI7AS+6GdEeAmcjSPm8iTs/eHID4Fn673UGsk4/5Sc6Uu6jeND/FkP
	7dh3mavaL
X-Google-Smtp-Source: AGHT+IGMjnZwEAiEt9Jm4Glsz7srOujFsqeA4GASDmYTpBVB3vgRlKNikYsg5C0lOJ+mSPfd3fXt3w==
X-Received: by 2002:a5d:6d09:0:b0:38f:355b:13e9 with SMTP id ffacd0b85a97d-39132d33c10mr18303880f8f.15.1741795589829;
        Wed, 12 Mar 2025 09:06:29 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912c0193bfsm21775014f8f.55.2025.03.12.09.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 09:06:29 -0700 (PDT)
Message-ID: <9721ca95-7726-4c17-bbb8-3db1212847ce@linaro.org>
Date: Wed, 12 Mar 2025 17:06:28 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] thermal: rcar_gen3: Improve reading calibration
 fuses
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20250305174631.4119374-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250305174631.4119374-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/03/2025 18:46, Niklas Söderlund wrote:
> Hello,
> 
> This small series aims to remove the code duplication that was added
> when adding support for Gen4 devices. The logic to read the calibration
> fuses are identical for Gen3 and Gen4, but the registers are at
> different offsets.
> 
> Patch 1/2 is a small drive-by patch which fixes a style issue of the
> constants found when working on the fuses code. While patch 2/2 is the
> real work removing the code duplication.
> 
> It is tested on both Gen3 and Gen4 boards, but as not all boards have
> the fused calibration values and the driver fallback to hard coded
> values only Gen4 have really been tested as I don't have access to a
> Gen3 board with fused calibration values.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

