Return-Path: <linux-renesas-soc+bounces-12116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903FA1069F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 13:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C046E1883524
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 12:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302401CEEB6;
	Tue, 14 Jan 2025 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/BLfpmT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC41A3AB9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857894; cv=none; b=Rs2bE4odSUdfC3fhr+aP/NZi4zTBg+coZWMbncg0TvsTnI7dF2dLE3x+1QNQnMEqc/2c2X3hfRcHqJ5MAkUyc420Jf/MQoM9/uo9jbYFWRDr8BCWGx0agJ8sa8Kzcx7OuexjeBOkHJ1+1Rss3hEJrUsZUZMnwhkebQ9k92jkETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857894; c=relaxed/simple;
	bh=v/BP/+eHSo6nCl+A1swIZ2aBuQMVznNzDPAtph/77q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2TFJNKmOQ5yuop+/Xt9/St9JOz9E+zstxomaCkaYQueFjGuAiQqEX5/VNF7+sKj8o5zpbQZE71KRtqMntlT8tk6yiHL8//VKEaJay/4fX86Rr8unJlcbLBgHG2YAXHxxsh8UWYWhPFTzyO2+W2TfJ9Wr1jVztb/RtVP3jimZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O/BLfpmT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401be44b58so5516560e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 04:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736857890; x=1737462690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKqVrgm+JtucALxT3qkFnV+Cc3j4glkaP81FWmZiLO4=;
        b=O/BLfpmT2lyKnKgaPvSnC9WHCe5Bh3COXpo9jKf3c6TyzwllD210/lB5PlB2wX2cg9
         peKpf/nljwf9y8YkbfKHe7d02S7y8dmUy/bDURoScmqLJZCL8096NxyiAV7zyWDkZuja
         agVzj7u5UY26W5IHbrasZjMd8Ncf2cetjZpRfMk9TdxzmKgvoGYdW/3kQ+GV9WnhCCA9
         7sLTRF9bZku+1+irEBRI/GL5S6jasF2rKqj4NMrRIjDn5GnD86Q8j8pZ9bqQ9zx2MxGI
         V4bCBAjxEgf0lv5fIjvCW5D66cWSnO6RYWIbd2tM7cfBTw0ZPUpe+RpvyuOK6lMdass7
         SDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857890; x=1737462690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKqVrgm+JtucALxT3qkFnV+Cc3j4glkaP81FWmZiLO4=;
        b=pPcD2PGPBdG7RW4dpcLXdGaIbP0tZDYtkWaoj6l2COJBkZm8fkT6xpeVhmRd0zBasQ
         L+19woCmpnj9sobSsrVi/WFml70J9f5wDVgSFyWOCZOqMmaoptjm1APw/lX09wu04EXI
         NrXyOMK8Q6uV42p1jvRMTjQAY0/FA3oJC8cH/mBx4Hvk461ZkGm/oaT9IRMTtHQNrj+b
         N8pZi/1dMahyuA7zJ9bixHQ1zCpsQ5nSKpqXVTOrI/5f1wwdX4JfaOxEhYHo+iBGxv3F
         8WNUB9ICIqMYV43rYSOzjL7j8nlOcOS9T7wucBJcoEp7OMi9vTYFlbpwdEwcBj+yqhuK
         r3yw==
X-Forwarded-Encrypted: i=1; AJvYcCV3Y2/PTl40jMoOeb4OMwthbEQiy+GG8Uz93NMaUidGQmZ6FjnAVHe90OsL5Q8XV4oDirSHjGiQ5PRFPNsh4EyA7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1TjfdxC+aC1dmrbYcMFs719MCzCgZRffyM2ELzOdQK8l5mzs
	pDN7EU4M68xAq8QQIukxuxHinzsVAQabEmwcfZ3aZvIwcMZrVRd9WqjlzZdT4XM+lKYfSk9Lkf2
	Di2/pGylt/BidjVlXTvoIkEWBjUcGYTkokPMgsw==
X-Gm-Gg: ASbGncuXBT4Dm6ogYkcCzOBwXCM3DChTZ5eidVHJxi1mywv5ybSlzbA0RCTKCzRsffX
	9/WE1xmHodCEcd8JJ03TXCMYevQyDrMZnm1tH
X-Google-Smtp-Source: AGHT+IFephnelTBxyWrrzDk4RhuS6rBwQxgV92W1BACFrfNj2+Z8fz6Y+Y3r4ia5hZ5U4F+LOUoBqsUCWK5Hq0fPyYI=
X-Received: by 2002:ac2:51cd:0:b0:542:9987:6e9f with SMTP id
 2adb3069b0e04-54299877145mr3673153e87.53.1736857890427; Tue, 14 Jan 2025
 04:31:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1736181260.git.geert+renesas@glider.be>
In-Reply-To: <cover.1736181260.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:31:19 +0100
X-Gm-Features: AbW1kvYGVD8UfYzhlwwT1gTLo4oUGLFlIvdcDtyWIMk8dZOQ2TAFP3eOKrTGlxg
Message-ID: <CACRpkdYseWW=LnyVHitBMud_Li7fRX9kHkLZ_3SOUqFgfvdc_Q@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.14 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 5:42=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 03fc60cd8e7b7e6f330d0a48c54545740addd9=
d8:
>
>   pinctrl: renesas: rzg2l: Add audio clock pins on RZ/G3S (2024-12-20 10:=
58:46 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.14-tag2
>
> for you to fetch changes up to 829356da700bbe07e13b4403997bf8c5aac64660:
>
>   pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC (2025-01-03 21:09:1=
9 +0100)

Thanks Geert, pulled in! Excellent work as usual.

Yours,
Linus Walleij

