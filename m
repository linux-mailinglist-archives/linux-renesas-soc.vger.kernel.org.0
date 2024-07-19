Return-Path: <linux-renesas-soc+bounces-7404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476A9376F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jul 2024 13:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1E14B21E1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jul 2024 11:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A06B7581A;
	Fri, 19 Jul 2024 11:05:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C61B86D2;
	Fri, 19 Jul 2024 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721387127; cv=none; b=IJ9iRFtDgh0R7ql3y7T0y5eTSIGO7DnqmxrmSqoBrRA6AOwq8fkcXaiNuU1ULHFKHIH92/qFXjQfGPpCVSJG9rND7m33anfE3ZAWQCaKqTIodREb4v9Ikb4iM1H25bs1h6CfDJksebqFLWQaqYtVrbxXQyGURrD0Bvi6vbWmFI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721387127; c=relaxed/simple;
	bh=5+eSYEMlg04YZMKAmLuA4N74wbOKkq3a67E2jk2l3qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNPhrJMuhW3a+tApezoAj54oOCk4iChV9KqCewB8SA4S6K4uWV7rjesA6K46+gy0hZsD7HRUCPA4TeNQruPwrEVz5WnOkww/KdzGXTRPWPI6uPYXAqXTDcO2+RcX88NrXmUIY5WFs7LaL8Hx2xUfBtVXFiT6ivPoVQWMYlDeeso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-66a048806e6so1302747b3.3;
        Fri, 19 Jul 2024 04:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721387124; x=1721991924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9Syv7sYvr8dFphe6oDhNBd5AoqFGOBMWLjrnJkdXso=;
        b=oG192ighhtiCzMJMTW/JlINIk2FykwmlxFh28P56V6nNYwtW9xuUwM5F8qyjmpD9JE
         k6OTo+EKtFQGoPaHogoXyzuLP8aaQ6VrY4R8a8svqnrNtP1YH2EHM9PXkwQC3ZUqWX78
         KXo5MsWG47AroW8Nr+Kmxw2yVk2WAHSd8K/SrOJuq2GJYWQF5Jpi4tfqK3PtCZ+FnIaY
         nwmndmtX1h5cHg5ecBq6A95eFpGu1KFgy7J1OPKAsDJh8BHzsoyYe5yAiCj02ciaSfUO
         iqtA2r/sI2aCnNtaUGbENXo34ip82iY4sfFt9C9gUJ7NTHf9+0nTd35nqORKHQHNE2P6
         ynig==
X-Forwarded-Encrypted: i=1; AJvYcCU05k3ug6PiSfcIUIsHPfGEq5rLPin6zjMZlAOu22daJINoywhPxnSl/939l/CVFwoGZoezymUZ40O9252C8LtPe2e6RXHuN+BCAo8OTqVrJMUXsnqN7TPFrKS7ZQ0/W94bmx7Dl13fj/vsguLQEHs=
X-Gm-Message-State: AOJu0YzOOnNzYdsnpy0ZMP2Qekiqq5+VzFNI9Ak6uLtotO4ExoBk+1Qq
	JekKDA5n2qbR8sB+nk5gg7kiMWQUjvCBkKGPjdgJ16JB5uyqdkWlraSbcqft
X-Google-Smtp-Source: AGHT+IEKuFH7oynVWhHedJO13DfB0ISzdd6d1ux/CTtMqFM290tKB3SStW/WJTHhswwOYI19wGk1wQ==
X-Received: by 2002:a05:690c:660b:b0:669:b45d:2098 with SMTP id 00721157ae682-669b45d21f9mr8762687b3.5.1721387123684;
        Fri, 19 Jul 2024 04:05:23 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-669545a09a3sm3941717b3.141.2024.07.19.04.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 04:05:22 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e05f2adab8bso1813553276.1;
        Fri, 19 Jul 2024 04:05:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkyoCqscBk6rGLWn52MN6tgwLCio5Opwx5UzCcmp+HAb8gpxxOKeBfn+b2khdXvqsjQTYhFZbo1cTWhUzrrOslvZnRbToLFJeurf68rQeUQrr/A2vwImv3Y3GHoNs+2/tSexnRwMbhT150LWos5JE=
X-Received: by 2002:a05:6902:2b93:b0:dff:3028:4631 with SMTP id
 3f1490d57ef6-e05ed729577mr9622463276.33.1721387122548; Fri, 19 Jul 2024
 04:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-shrubs-concise-51600886babf@spud>
In-Reply-To: <20240717-shrubs-concise-51600886babf@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jul 2024 13:05:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>
Message-ID: <CAMuHMdXc_VPRLg1N_uCerXzzntJ23pq6m3Jb5eSPVZjxuXjHAg@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: run savedefconfig for defconfig
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Wed, Jul 17, 2024 at 3:29=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> It's been a while since this was run, and there's a few things that have
> changed. Firstly, almost all of the Renesas stuff vanishes because the
> config for the RZ/Five is gated behind NONPORTABLE. Several options
> (like CONFIG_PM) are removed as they are the default values.
>
> To retain DEFVFREQ_THERMAL and BLK_DEV_THROTTLING, add PM_DEVFREQ and
> BLK_CGROUP respectively.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

Perhaps we should add an rzfive_defconfig?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

