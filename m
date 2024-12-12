Return-Path: <linux-renesas-soc+bounces-11271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010029EECEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A78162951
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1173D2210E4;
	Thu, 12 Dec 2024 15:37:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED112210DE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 15:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017822; cv=none; b=l9L9M1HzLDptZcgtyRubZyYuLu4PjADQovRDq5k8LoXdo03kb7Xo5qhFARSQT+m89Gepwqi50/80LaOs2swwQ8egH55XJcy1r+kKT+ipu3qr46TF3R7zvjvbby9dYsTyLS5Q2vYsb7o7DHJqlYL3qp5+FltKq5pi9yDWcsrtaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017822; c=relaxed/simple;
	bh=lD4uu/hgjCV6k9TwP/iz3vUdX/bde8dzuhJ26uapyj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiK8V7EXK+yHMV0cIf6B1ULnjN+gKoMG/A4xnopUIfanASLS9CShmLPX3L841eUVpQrqET1wdFJpcMo545GQzSo9MwEVJDbrr/hCp4D/WkiO8VKZzTYcMPT7oB1caqS9BE2HWudPDsYTU1odoR6ggt7P+DL4go8dehPbQC2fI4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46788c32a69so7938561cf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017818; x=1734622618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeCyqmn+Fnzidtik5ZQwdL7fhvipeWTj4Y1csRd8xgE=;
        b=rqcml21/m3O9WWseW294lB0m7qfLfGSxiBZNZUdmPfOsuEQJONxK+p58gxmejgVjXi
         SMVsXUXj/ImSpAO5QRQ5pL9v1isLiIcFakYKwhdzqtFCYeNAr77fLY89IRNMajq/Tu5i
         YusXYlAH/ghsaUtwt5KziXEZY1aTl+1f3IQi/f+chSRdvwWV6ZazUfwcMaJUtowz/YKN
         oJb8sBgz3BAcBHPZw7ExUPk/gjVdYtRS5WxoRAJvAy282+S/2LX/QlA7nxgVyCCFD8wB
         31XQzo4YkFv4mDb5AwHkQtwYAcDxLED2hYucEekTPpT+8tEteSakFF8A7IsCDIwi/sVh
         VuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB/dhdLGtQzlnzErEi4LtuZePWbVkEccZc3zTeHbuEEw4Cp665KpQCQM+80eBHF5Lw8CEucYwO4NYmpLtWKqNOhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuaOFOyoPHOO9IGA4tIE0xEWbew2WN6Rvk/Nd2uM9sTtfL7eHp
	9RT7dh+LnamEyEUfeTU1s0HXDi8Jrn8Iqfnvnw1KYlEWs+kO3k1WmcAmcKYRsFo=
X-Gm-Gg: ASbGncshJCUcSS2FyMSnj/smis1xBYooqMIyguqeHOwOOyYee8LmoV/4TAHA0qBzjbz
	VlXCE1Pb9pHZap+1cDbf2xKJ24wDGltI6KHCGLdtXWGMyyDb8uiJ5s9GE0XRo/aYDtz+shqOJ4T
	b4L/xCg7J0TsyspTUxXd1Lym11Jz98Za5OX6hdJkaHafdJNRhDVTJmV1zrVysHCtm7+uuVM9/+Z
	zWjTuVAICsUF2HcqCu2oaHYll0L5lgQZDft5+Yltv+xVfRQrnkB75KwglcCHIWiW7bDfNOKxeTS
	JZ8FJ1LFFk4NNi4VyZ/fZt8=
X-Google-Smtp-Source: AGHT+IGdCZAK2O+rRDWdDuiB26lg2gFFomhl42DKg3YavN8RaJ6KAnjGtrnHfbvqLvd49b3oTRfi7g==
X-Received: by 2002:a05:622a:180e:b0:466:957c:ab22 with SMTP id d75a77b69052e-467a16c1d49mr8846071cf.43.1734017817983;
        Thu, 12 Dec 2024 07:36:57 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4678afaaffesm19319071cf.85.2024.12.12.07.36.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:36:57 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46788c32a69so7937761cf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:36:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/V7SxBovbci97vV+Agrz1mVIFKaUjJRTrqk7rEWLFKkx4SwevsPh8nPx2dl8VkgBC+ln7YKbBeFAL72GzxW/NLg==@vger.kernel.org
X-Received: by 2002:a05:622a:8f0d:b0:467:53c8:756a with SMTP id
 d75a77b69052e-467a1605bb5mr9849991cf.26.1734017816967; Thu, 12 Dec 2024
 07:36:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-14-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:36:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPXicL1+suMeYrXK7qEmLYE-1uuHpMys_qnxqz9Ed8KQ@mail.gmail.com>
Message-ID: <CAMuHMdUPXicL1+suMeYrXK7qEmLYE-1uuHpMys_qnxqz9Ed8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable R9A09G047 SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:51=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable support for the Renesas RZ/G3E (R9A09G047) SoC in the ARM64
> defconfig.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

