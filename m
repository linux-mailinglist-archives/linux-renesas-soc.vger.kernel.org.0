Return-Path: <linux-renesas-soc+bounces-22494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340BBAF5E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 09:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB22F7A2207
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 07:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D96526C3BE;
	Wed,  1 Oct 2025 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvhcmhwp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7123726B74D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302876; cv=none; b=erCXdly3no4Zq+yiDWUHzw7DtojoPD11tYDb8mJ1xddW8cqdKFSnbQsmLjtlYA4wajlBDdZrUu3fXmk/tAaZzVv+0O9RSXm1aISDzhWdqMwU4zqLNWjyjlv8cTAEEp57qnvTeRuCQlwMUXAw6pYMSMfY2oh9f348IzxcfE7nw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302876; c=relaxed/simple;
	bh=EaHPOxmssSF62mBpn0FDhyXBbBjLH2p8NwaZdyrsCZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ltXf8XxOKgqhS0u3iyOO/gjKB8b1RiA3hXAqSAWy3Z8t/lhfVpBJ2GFDXQM1MlVoJvqz/k5fp2ddFzd09MacjuuU3Y2+m1zFEdGfpxJnC/8l6LYcaKUGTETB4bOn/uJUHu0IF+VWMsevGZ70u1OJ4DCzv+XWKEwSwMC6NzKhCCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvhcmhwp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso42098165e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302873; x=1759907673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kf5dynhRLldJCNs2IEg0+64rtOtAeTZkEe5n/sgM2Y=;
        b=cvhcmhwpN+CYHFwKc8FacSSWta7oQtQQGV1BvRf/+y0O5n4yZn1Wg9hWpkOzJu/Kva
         kuAHfaw92L7Lbuz/SrEL3X4sMr+8BqMsHEOXufraq289vGvqv44FU/byk5xsIP8RtHfo
         +FlrVB+/jfrY2zUnAs5tM/6SyCGaXvtHpMAumfe5/BNh3v5TcI6XX4uT/RbzPuhoz0O6
         6gESww+Not2HjrXS2g5Ryvc0X/U93ePms6yQhzRznvagp9Fin9knCkJ8As1ZDnZTn9aU
         xlLFNRAKiDd+Tt90/h6pLIg2e3mGVh38wJPsGE5Zvmp3bzhggHb4Ex/aIj++R7AX3S5l
         vh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302873; x=1759907673;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kf5dynhRLldJCNs2IEg0+64rtOtAeTZkEe5n/sgM2Y=;
        b=rMuDUJBg1Pk0wucfAaJ9pkoFRlJqwvKBFTCKmb3xqudUUsWEnec38mBT/jpC3Cqyll
         Spy1GL7EIaObMTza5fY2XGdtqqijWzm0FBzaM1pQpM5Ng2cSlu39WTAl0NmSbDhAY3g7
         LyEHBY8oDtLNoo5VMP2ZHFCVEvJFORCxiA6uxsyW+199gdYKPYimwiEqDZcAFukBLTZC
         KaOV25wdEijpt/Bx6ndmTUtP9pMvk1/rdy+8uAz0wX9PDoclk5o3iCMRG+BLchEE3EaW
         4zyLgaQCPUUYaG1W0vtzvT0Xfl9SpExlHtg6M+C4zLWuLQvskRsF3Ynwepq9HCb6ilXd
         fvJw==
X-Forwarded-Encrypted: i=1; AJvYcCVM1BZ9eRU3AAwlrA4lzxcEbwsHiiNyVZCcFc1SZnr1BtahUbHgMqrDQHS4J52gxPIr+EX004ZhU6dL4qmpUI1Vbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwi8lQ0dWd8m+DCAA5yK76xoFJIuMqYBAxK4yQ7IbXRS3sJQcR
	i3/AVwJNI5qbh1XxfznxTX2VG7k5znAjlCHsXgGJo5WwLT2Se8KabjjTVhDFqzBeEWc=
X-Gm-Gg: ASbGnctN0CxeHbSXViqLR0mO3fzs2b0C47kSOZ05DQE0kaDQNmL48ubMfLyRF/C4hut
	24GZP3eilxHqp5BBpVH/J7pVqTAE3dEKVcpfvhK9vjrk+qSRYlOrXgg8Lc1Qns6d/8TnuOEt42i
	pBeUJLlbYdtPI/WTdy9CI7Zlp99rGoHGIwvu3VqmrD9RHd+1Y4PoscNcjFrKpyi+fr6o/6ChLiL
	OF/AQbmUCHRHQD5pWvjMceaAZ6EYSJy3AVV2wXHcMjZUjsbeUu/1UF1jlyxd73fWBHPHLlsbDvY
	5IgbbRsh2nXE9sbJ9pyfoMjLClpTBwSK7TdfL+uDjDIcmq0MomabMuMB64GOlWsIojI45x8FIbb
	uuRpItgVvtBWuGpSlrZkjHP6NgMlT7JKJoSPhVayE1c42kHtiudxAFBTgqF5FEfV/ofA=
X-Google-Smtp-Source: AGHT+IFowAj7Hze66bm6j+kw015O7nlbY2diRFniCjTtOMsjXtusPU50OP7bOKSBUfU7OwfjEU6VXQ==
X-Received: by 2002:a05:600c:8206:b0:45b:88d6:8db5 with SMTP id 5b1f17b1804b1-46e612192d5mr21887525e9.12.1759302872517;
        Wed, 01 Oct 2025 00:14:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b7e37sm25185825e9.1.2025.10.01.00.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:14:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
References: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Turn
 ILI9881C_COMMAND_INSTR() parameters lowercase
Message-Id: <175930287176.425863.10274979935592534719.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 04 Sep 2025 22:55:15 +0200, Marek Vasut wrote:
> Make all ILI9881C_COMMAND_INSTR() parameters consistently lowercase.
> No functional change.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR() parameters lowercase
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/02b6babf22eb60d86b4030f08204f6e7853da4e0

-- 
Neil


