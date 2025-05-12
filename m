Return-Path: <linux-renesas-soc+bounces-16986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2CAB3CB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 17:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB9216A59E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B306B66E;
	Mon, 12 May 2025 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OV8qbHvj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268B923909F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065054; cv=none; b=sQg7As7GkJwK2Z+pesM89wLqtF4fV6AiYoIhw0+Gl4v3V4KuMV3CwBlmY/aZdf3vGzqHrsJDJ8twW7jzmhSohSPjZ/poVwMBgX8Bydg6psqWBjTlggAFctd09GmXlf+exktpYloD4w4wANgvootos0Vw0vxH6ksp2rof/KwMKr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065054; c=relaxed/simple;
	bh=g04ojqJSgO5fmCKDjJblgC5ZqP751lCrvJ/UA1FmmJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vot7KVQlLso2DE4ma5lpo4ALjdhAbyCVNA2VQdakHZEXOEFeuYLfZNtwoy2d3RlY8H1yV0AAV5Dt1MPjoO0PZ5FYMfYgQcsjtQHZWLYhXBa9QH1XPI6WtvS4TI9Ode/9gZQD4+2SZzVnUpDzgtOm2Udyf1YzNNz7EndTyMrfuV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OV8qbHvj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so33701975e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747065050; x=1747669850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cgal0nArzlA/5FhTbdC2bKf0czreUrrpYhFqhZV62dY=;
        b=OV8qbHvje2Tr90X4hTfyTegTYBi5HLrdtixLJz88Vx8VbIzTsR0tURhE9TACfmYtqS
         8RF+sKhxvkhqF9mjkCam6GBbwyS5yUvAYWg4vAPxD9B3q0xWFyRu+pHpuQDcj9P/MNNo
         4pebljuWxH+Pg1NYJnACRfMm3UUvjkmC0YpJHOGlHWUFHDGsYHooDeq1ZM5QRFqUZMO5
         feSCqK7pyq+cDrGPM6SN9E9ksvqTKCGH2P76n007bNpNYCvawQ0O+/7wgfYVte8kgvWL
         U4b4OCS2+AoUADp9KpaHbJwXviJ7uyXNi2iEVWdcWnGvJ7suK52BAaNxKjr2eRQ1CIcc
         tlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065050; x=1747669850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgal0nArzlA/5FhTbdC2bKf0czreUrrpYhFqhZV62dY=;
        b=uLWe3bOUeeoeGUN5NGC/B3pMhzUcu+GWD1pi+PCBZFGe/Ee7MpZr4S7VZ6MaPUdXV7
         L9MXuXPpAet/IGaOSe3s4+6yA8OlWeiJZBMChAhoh8834cXqCejuVjFg3dex5+6V7pZF
         NfKL0M1chWw9/m7FJNOMJydLPvz1r0z7CpZGnxwsICwzGcLluNrYZUyOeSdzI2Fob8kh
         Bt54OtaJakN5XwJJD8tIru/L3k78TxtrpNSARzm+0iVruTRLrk3aAyLU97fP/eCYNWsp
         2O3pOwd+dQRKvxUp3NiHTmV1mJIGcE2ZKYmDKFidZWBk/ceu6Qq+xdEr3jzzGAp6sSQo
         gQMg==
X-Gm-Message-State: AOJu0YxifgCfrnoKlVWAgVBstlE2KauE8ucDihJq2+3xrYKl6muExWhd
	YdojWq7/9o8JyoxgDRnn9ANBtJEzeZpw2doTKmU40CqKPa2Au2HVuUjK/QlTHiwzWE8eb+lhaxs
	XOVg=
X-Gm-Gg: ASbGnctIRvgwJ390LDTcUxqOSOF5mK4oywWRlbV2oP1uH7ly61f5rb8/hNAIelvkku3
	G26Lyc0xDEm/0c3ge7/nJ7ajRUX129tSgBOKndDqnvYfO+iVQIbJdCZx7iZHtMUYfrVPmu2no/f
	0fu+E9Bev4DvtZXcaNAZYoO92JtCVr8//GCkC1rwmpMCY+hSbzmD7xPRFkb2vICg561oak+0cLU
	UuhI7f/lIUTBiVbZ+BtDWVGiB6p8S69qA7XDRBPSP+sVl1Vk8XWO0bb2FSfZHNEPToNlsxgg8sY
	r++ReKXg8vsCGf94Zip2EKqASrMkZRn7bApHP9QBF7zt3WV2a0gqA5x0FabgxG2zK9sCdfbsOnd
	zq78bjwQAwx6iOvsVKHPNEGLx
X-Google-Smtp-Source: AGHT+IFNsW5+O59HSqMycKUWIsHWCl2KtZenWg03LyVBqJ/RJXz1dJUqh7GeQ5WUQwN2fy2P3TFvMg==
X-Received: by 2002:a05:600c:8207:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442d6ddcf2dmr111987515e9.27.1747065049729;
        Mon, 12 May 2025 08:50:49 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442dc6f1a51sm97931075e9.22.2025.05.12.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:50:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer
Date: Mon, 12 May 2025 17:50:47 +0200
Message-ID: <174706502332.6905.5544454633711754338.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424212234.5313-2-wsa+renesas@sang-engineering.com>
References: <20250424212234.5313-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 24 Apr 2025 23:22:23 +0200, Wolfram Sang wrote:
> This was forgotten when the analyzer went upstream.
> 
> 

Nobody is taking it so let me queue it with other GPIO fixes.

[1/1] MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer
      https://git.kernel.org/brgl/linux/c/579cb52ecd46ce0351fc3d40882ebdb60332a0bc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

