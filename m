Return-Path: <linux-renesas-soc+bounces-3104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5585FAE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 15:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E31A9B24AD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A43A145FF6;
	Thu, 22 Feb 2024 14:16:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED112EBC0;
	Thu, 22 Feb 2024 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708611362; cv=none; b=pIO8/PON2n/eURWrekpE+zhFDyOxWjg/gRTCHxk8SW6D0tzVEGUniE3vj5j20xlpXqwMtg6V2Eyl4zVA4vC1WW8ppEknV9X/DQcdl/gQbVO2Boam4j5vHP4G9Tz4E+pBnwZtejLtnn+7kYiQa2jhkEHgBeLTLtHa/EcFl5lxSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708611362; c=relaxed/simple;
	bh=DYqF1UZ1vPcBAPEthNWj7VFurT5eGkMxMSYqI02hJ9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVagQQaogvpy03hiZ1/QUr/u6UhZb795zdmxLG+Tca5o5okNQoOcA4hZreLMMpMoIryO6JfI7XcdDQHNIwxkvyBr7tBRIOh1yvQWeb/+BqEZvzG9G9TDdsraxn6JB9W1y55deczr6IeACVYqOvZu76RJeIsbaXYSiLSNhU/+Fag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-608aada6268so2691307b3.0;
        Thu, 22 Feb 2024 06:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708611358; x=1709216158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJg6ceEh6y9WFJ9bdB2UqI4oLw5M/TjlT/GmwqhyFNY=;
        b=FEdwd+s0IUYvkIaXJTcKY6vLD32pswmVu/83yclwLNkyVGOuKbsP2/OrX/kUQI+MCo
         4zyWS1qyADDtiEpBM+9hMkocPyA/ab/Cvw79ZJLOhat3/YSWqmDzV+YtBeihVm6Xz7pH
         NCjI9T26prN0NjnabrgF5MWRTpThYFvwHzZYWjwYytc22pW8UEsUPNPPF8RqbO57xMKQ
         baThJzqyCOTGxJL4RBl5Q/Ev6XAAhlrO9PfVJUlpgcaXUyTflczqnDR+x2TUhdPXfMqs
         DGDeIqfryP+OsbEdfYdPNUzZ9CZo2wqkkkmobycbkBhZNgnAxlPhRUzb1jnMFm6XVxOR
         9yzg==
X-Forwarded-Encrypted: i=1; AJvYcCURonBVUbZ8SFWuK4blnAWVGEdPbG3/Y1jxy9+DnkNPW8T/8f23djkXAkSO0UxaeqpffPFEZ0il/itucMXXro7eGHzvrQqFRpl2BNsx5EAOnwZNmQ/nttZegqM2LGSDSlI2+F1vP+QeUtO7ajkZ
X-Gm-Message-State: AOJu0YxSOhEkMik4ExraMyoWQYe4q5xNXhMpc9/7wbSmBHptSQwd1xvy
	lZN+oosCWKETNtR6s4ZCgdZgSfR1njR5gWIC7JGIUyyR2vSFSgO8dPQlKJxml9s=
X-Google-Smtp-Source: AGHT+IEdKmMjkisyEMXDOqmirRv14/pmGO9pGBt1Ejhby5RIlWWGKba7h/0uwKwx9+BbElyjVa+aBA==
X-Received: by 2002:a05:690c:3602:b0:608:5dfc:1336 with SMTP id ft2-20020a05690c360200b006085dfc1336mr10178255ywb.39.1708611358329;
        Thu, 22 Feb 2024 06:15:58 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id m127-20020a817185000000b005ffce9cee9fsm3094629ywc.12.2024.02.22.06.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 06:15:57 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6002317a427so66156427b3.2;
        Thu, 22 Feb 2024 06:15:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeP1eUrBkUOGI360zsBXy4RvwgOjb+QfFTAlVYAluTYh7tgeUJj+bsyrLwhCEO37pHFP+Y4HgSyFasN/AP9ZrFlihmtjUqqkVcwwGEqSartlL8SOrIrpmjO3ViIaw8PxKyc427gAOPAw09WN4E
X-Received: by 2002:a0d:db45:0:b0:608:d1f:1088 with SMTP id
 d66-20020a0ddb45000000b006080d1f1088mr14320639ywe.17.1708611357688; Thu, 22
 Feb 2024 06:15:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222132117.137729-1-biju.das.jz@bp.renesas.com> <20240222132117.137729-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240222132117.137729-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 15:15:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh_qDqasd-N4dfsYcobXRscxfiKsKPRY0RfUqvjZV9eA@mail.gmail.com>
Message-ID: <CAMuHMdVh_qDqasd-N4dfsYcobXRscxfiKsKPRY0RfUqvjZV9eA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] arm64: dts: renesas: r9a07g044: Add DU node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:21=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add DU node to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v8->v9:
>  * Added ports properties.
>  * Dropped Rb tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.9.

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

