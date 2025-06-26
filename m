Return-Path: <linux-renesas-soc+bounces-18767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F3AE9909
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 10:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A515A0C79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EEA2957C2;
	Thu, 26 Jun 2025 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uuUy6mmD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932152957A9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928017; cv=none; b=nUk1f/7sZomK3wPmrGakmmgxHBPNmrk+Hb/9ox9hFtnyy8kwjyi9iGd33VibhGsVGnWW6umLUGtKaKKNm81rJ2FBMH/EEmnomRE8Ax7L7+55ZaReUh+XQnOLlbRlwPzvyKGRkRpV5tqvuroc2L0vPTx0Pt2R8WW2TFtN77zLYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928017; c=relaxed/simple;
	bh=V+Sp7fen2qtQZs4jIVXJToPjVuPycMR9pNG6QZbuznU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQmLVgQeMBCp8XXniqTzjt8j9qPeymh8hpLEceEJ0uxLIFyozUKF35F6vz/+cZorsm9hAKyenvQtspSu76IDabfsUqSmvIY8ZRrz2Mi3lylCQ/bubf+dKw5Djy6MBxAVSxrgj6CEcelLxB5K6nXhTlC6q/hM/q8CnGXk5VRS+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uuUy6mmD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so679348f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750928014; x=1751532814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHFSivCg/spytmsC03nloc7zaZxjmdS54OyFvtvWpeY=;
        b=uuUy6mmDx0T6es7fu9IALBG5qN/L6R+PSicW0y19hdNJ7u1EVtDtHe45M5ReDuP+oQ
         u3/VqovNf6IiYIqWyyoY9QFc7mwlCCxRsFN3xlqFJFVNXPYObWPkc9w6dQV6goz31fr5
         Zlzx5nY17bp/VynUiLjckCOU4WuBkR3dzV3QLdwimTfVToMGNCkNjJp0EJQpFqmCOjnZ
         DVjFHeVYzZ+BT4rYBUdcpT6iXQqiOwrC4G1c3p9k/v6C6W+0M2lshIDaWswUFfA0X7En
         RAlK1akBvdTs7HbSelaeJfaqaXywPN4AqGaC+e0mQgBmvOVxgup4SQ2VlIsGcK7SPvF/
         rjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750928014; x=1751532814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHFSivCg/spytmsC03nloc7zaZxjmdS54OyFvtvWpeY=;
        b=WcY5VXfIjYxt+s+bu63MEeGLt+TWcUyzYwoLWBjusBmoJWtdJd9MW2oLb5QXPtbDrN
         uiNxsxNU+8gG+6vjJRLgTLXA3x42saSKEqQz9eqIYqXgQwxyV+4IZvirrPxpt8LjYnKO
         vHI4JBOtK3HRWc28IIolG4NleipT2ch2oEglxJJUlWRN2oV8nmoNbRaqEznEJXHRXGX0
         vZkt5rHkClispK5v7titgK2tT9hUHCCOsdlDLwk6njk5KI9S8w6pwvW+Vq/dvB5rO9v4
         uXt3hkwvMX0AQ73L1oRnC+mFYNrHRyjJlEWe49BOodKsp7Z4YPZ51YIA0FFNWGGCS9ig
         HhVw==
X-Forwarded-Encrypted: i=1; AJvYcCXyjUsWerrx1UrjxTZ89Yd7dXalUdZrjv9uyUIFd/c7xog7TwfCk7MwFKotPviFTpzORBcnaHRbckCUtP6Za8Q+Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWLVVaws7dbXwHJb/0NZ9l9yfnNyyVzhQlpXGm4ZVZONEe1eC2
	okPIDvz4vmyhtYRV6ODt3ZPb4OkZcqfu5T71OZTzrCqN+UM5BM2pcLXZfMgNE9kkYM4hEJS7KXf
	dbmZ8oVs=
X-Gm-Gg: ASbGncvzWtiRpK05QEzZFkmDRw07biMelio/tc4kf+ZUovmc4RqchfIGKzVX18ADmGS
	OP4nZsaFABCIoHTmnuKwSql2neWOMAcMfIembG+IcQsrN/6njQPa6TuJUAIbfJSPGxC6cT+ieb/
	Mu/vOxY+ZeAclDD2KpHH9u7xRlsUpnd+CIabepq9rT6rDDO5vLoSm5e70qVWHR9RRcCtJ64QeLo
	1sVoIK2jKX6P5XwDUgthjTSqBAo+gVueCrH5HrGXM2n/EIe9S+7ychMBNONSRjfLH9Nex0+uB1z
	f79pOHudwHd+8rAVOWCdoYePTAGpnyFDL1PfJOT0h3wYDOPo9nGtw9kHdfGA
X-Google-Smtp-Source: AGHT+IENF+K1asS+T1pwLUr98Oz5aclWqP5A7IgCOFSxouvNv74nb2b4HyqVL83k4pH1phQaYMyNsQ==
X-Received: by 2002:a5d:5f92:0:b0:3a4:d722:5278 with SMTP id ffacd0b85a97d-3a6ed646577mr5688868f8f.39.1750928013671;
        Thu, 26 Jun 2025 01:53:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e29b:52b:8f3d:6109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm43261615e9.22.2025.06.26.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:53:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: rcar: Use new line value setter callbacks
Date: Thu, 26 Jun 2025 10:53:32 +0200
Message-ID: <175092800962.17393.17614855967697488644.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1750838486.git.geert+renesas@glider.be>
References: <cover.1750838486.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 10:05:45 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series converts the R-Car GPIo driver to the new line value
> setter callbacks.
> 
> Changes compared to v1:
>   - New patch "gpio: rcar: Remove checks for empty bankmasks".
> 
> [...]

Applied, thanks!

[1/2] gpio: rcar: Remove checks for empty bankmasks
      https://git.kernel.org/brgl/linux/c/28a9ab01f6ac87afb78cb18098bc37a74db0d8f0
[2/2] gpio: rcar: Use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/3315e39e5639ac770782b658e499d45f68ea7d82

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

