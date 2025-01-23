Return-Path: <linux-renesas-soc+bounces-12400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 286ECA1A711
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DCC33AB1C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15627212D96;
	Thu, 23 Jan 2025 15:27:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCDB212B3D;
	Thu, 23 Jan 2025 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646046; cv=none; b=Ak9IeYnt9CNaoytA6NNpqDj2XqeHtwShBawZlgZxj5bfAqn2W+t6oBr0p8WEX/dNaoouxPv15bmkMlERlNfi3JE6jB9Rpfo9X2HireZD2X1iPKFRI7FTG8eyf0KkTmKwK97JBifmHDxcEGPBpH2OHnjIXrJj2ItcZT0ZpfFk6+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646046; c=relaxed/simple;
	bh=oaNoxDMiDntXyi66lcz+FmmY2IP5kt0GC3g2GTmswes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ib3OwCvRLd5A2SHsws+T/0bhxvQ9/SdM1YCpaxuU3Wrg/h1RIfba97EXLfCjwpASVxk9sxSlCCpnlALpKlJmO8KmGWKs2teP4aZGNluJ+EkP9PMNSjhckTT5IiSdvYqUOc64mhmV4pa9vEPVKtnqw00ta2gCpk/Y/SX5kdtGiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51e2dfab53bso603438e0c.1;
        Thu, 23 Jan 2025 07:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646043; x=1738250843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ObmF4EAbz69jChCTuuA+EV0Ksc0exXQpmKmEqjaiDU=;
        b=Rzgo4MsLO+xnN5uVzEZ4wP2wtaytJ7is1n1f2l9pM6qWfNq5BZhbFTxNaZ2sGMYQA6
         fSLdEH8B1xHO4RRaSIqb4+0PIZlJKFC0JQ8V9VFmDy/x1Rsmjbdi5GnX/wVjpRsP4Iss
         YInjktnbNYCcuGrtVFRvWCVMZSuOBshXXg8pShqPcEUhxsD4+RJQxzCFKZJX1y9LX1O0
         l93GQ64Wfhnsi77JDpJYcX/so29pgFLvKHWOpR/k9SLwFqlb/LLOvJO4Mb6zvPqq1XqN
         hmN+51hOfNYQ5VZknk0Y7Y2vBj9Sm7G1JqcGKUu1I6/EKMVzXMY8RxKkHqaGgC5VLiYq
         0QUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFWAHFi4KD17OG835IU6wuVS7yX0dQpgEKFVQKqxO6HFE0k5UxYzU+MtLJ2FVJYZRpiUJfbdVjlAWPLI0grqTzbfY=@vger.kernel.org, AJvYcCXKiTKnMYi+to2fW2Z5GVLCO3yd1sYgYx1AVpG65LBC/Znz0BjqJXv6Wt8/lOZN3reraFMTAQTRsvsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wfx3UhwXKhlJ+ArC4TfRxPvjZSIMDFlSsd4g9N+ZWt3yHXQf
	Pe2ComMtPW8OY/lmZEnuByxH/FRltYQOmxTE8s6dZZiY9o6vhf1GqRppyRSG
X-Gm-Gg: ASbGncvZclMqd4MIIW0eIdjquNgWjvnBpFlJ8VAg3CjZlq5L6EMNDy6JGzjPA4YewFi
	elrXc1cQfuI4QsoDBGLKjbHrZqyn+NNRYWEVj35a1oKVUABhNlHIRPcx/KjDV14MX3DaUe+HFt9
	gqATj0K5t5X1CkpoelGSy/kRm1UbLqEnICcFoFsq3DWUQoxOIgX8Xfjf2vYnP55EhiUdmMWKl58
	L1sEwRc3WpsEYGvCudcTB5ZTxcN3FOGKR1ZUTMQBrZulRx8uGmagB37BUAFfJNRhn0/jMwn0buW
	jOn2exdC8KTNuB6TKInc450FGQL1/Vhpgb2dhOiWBUVVmCk=
X-Google-Smtp-Source: AGHT+IEB/XHJTQrTj/HV6K15ewvH1r+G6N63TxgyIJOO+SWuoarBVFZEdgLGP5xNAm6muwKPGWKGcA==
X-Received: by 2002:a05:6122:438d:b0:518:9040:6700 with SMTP id 71dfb90a1353d-51d5b3b69a0mr21239241e0c.11.1737646042581;
        Thu, 23 Jan 2025 07:27:22 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a33f5d7sm3231917137.27.2025.01.23.07.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:27:21 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51e2dfab53bso603409e0c.1;
        Thu, 23 Jan 2025 07:27:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoXtTrJYIBob77FiAlm9xL3wo8ikNjJlenO/XsD2hVlkuVwB7SeVqBKj8bGAjHs97DUhPteYhAp3F1@vger.kernel.org, AJvYcCWjToJya00txTCfjXt6JFxM1l2G6XkL9Y7wNs1Z6tFQyfy6GfVeMjXOOSesJzMgoAkyKnNosjnkxRFsp4Zp6Bpujjc=@vger.kernel.org
X-Received: by 2002:a05:6122:2388:b0:51c:27a0:25b8 with SMTP id
 71dfb90a1353d-51d592b4225mr22852885e0c.2.1737646041403; Thu, 23 Jan 2025
 07:27:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:27:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSasSLCE4_oGPUync3XxoESt-CHVr=pZQ06-LZRpBNdg@mail.gmail.com>
X-Gm-Features: AWEUYZk9g_baLNniWFP_GhMat-002Ka7cDv_endiqh4DLReqMtzsEkVZBq2x96I
Message-ID: <CAMuHMdVSasSLCE4_oGPUync3XxoESt-CHVr=pZQ06-LZRpBNdg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The r8a779f0.dtsi now contains labels for each rswitch port in
> the form 'rswitchportN'. Use those to access rswitch ports and
> slightly reduce the depth of this board DT. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

