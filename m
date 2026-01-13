Return-Path: <linux-renesas-soc+bounces-26696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1071D1B082
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 20:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A3F8302F931
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 19:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C7035EDC8;
	Tue, 13 Jan 2026 19:26:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7534EF0D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332362; cv=none; b=nLybJYzxZGjk4KvqFfkmAjpZetZL4PJTxnuGpGDtrJCy8omMK2Q64OyoKSbrRAhgTWBJR41fyDhKwwKVcNz90OBBDhtDRFCsFiHr6oNL69GiJPlmdIXl+H57K4rK2X2P7UHJnOYZxMcGfeVn0PSX+s8SRHlc3KM5ML1HWo0crPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332362; c=relaxed/simple;
	bh=3ZrwEeBiZv2/57vkV16rP297m0IfYLbOdaycMnUgZvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdHRfNb81DSCgrL7qE0f4lSxCrRwP32JcCTu4oNgILxhHNWmd6uftcgFoTTxsvqUu002J1yEIDmBuz7BxQOdz+vJdemunfig90Rg4CuWsR2kijVCpV/F2Uo320lrwjZvoVkyHcIRqKf+V9Ir3CtT8n38gM49UQgZ/fLH3FvVsMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-56378a18ba4so936539e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 11:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768332360; x=1768937160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGxD9M4RQU4+hrSLm2mQz70yQm9QgTmeWCOFRtIxY9c=;
        b=D6KJ60vnTKwcZ9FFuklA7zQtUuT7KbSrx2P42IqT/hqvfNrW98HwBadaO5u5fYn7tl
         5anlrgbAPEqfPc5xISCHICWzfXt2A0xLFCpCprA8wh1htHCYrJALr4rZ7ry9/JCB7yi6
         PcMmhHEgHfeUXKnAR0sizfsCuOvzzKUKX6vk5t6vwloiGbx1IF0lSHK9u66TWsFsoXvy
         7CWIWfZPqNrNM+95ah4iZ+UBkCq2ssD9vINuPqFQc6Abh/ue2QiskIEIvAOyeX80OHcC
         5GRSHkzV2EKpCYHwjgvgFlcwqQeW0UQknFpcBQuTEbhHirj0taXOmq8j8HNJDxT2Yw9D
         Yn+g==
X-Forwarded-Encrypted: i=1; AJvYcCUL9MBJ+SJIPP01gII/Fcv65/fnrDk+n91gYHO3HFQ6Y4FA3So7hXStBuZ0i+Ongpff+DAhFc/ifkzM/81iEjdBAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlwEckbyTtvXRTk1Ff774FfnV68XXz3H9QtwGr+JRetgwlAP1
	lYUY542LjnleZ1qyFJ1I9wIjsEGkYa2SoBAhCqj26699ZIyDgIFRi26LqBILlHzPXPY=
X-Gm-Gg: AY/fxX41/3mfERf+jdNDfTZDBVZLbKBWt6LXvPnewz8bbojUtwnyVwYSW5KCq9WQBSE
	I2NoosJx3AkHSRht+Unrk3XEE0MQ2O19+V6ATXl/Uzs39rVQpnKUhOn5MK4wdEGGQH/21KSN8N2
	pQ+eUv2wsLepHFHzHuLXQftjHnyBARYJs6DyicpEHa79K3acIcOVuE3WW4iAuE8hskoLmQ1f7X9
	TOABy+A02z5IsTu3RtHryo4qG9qiUaPq1ksQn9lyGXOGA+E1t5OVT5nKI0VKvYDdvMgUdzmm5EW
	2dw51OtpgKbNqlNKEaY8g6Y1eg3Qe7UpZic/iWrLov6fHr+128vi8NVuTnKeYYTuOeJHOzjSZrw
	KLslISHMdLb5jCYPI67HfVG2WZs4dMCQnaZGsG+9Bfg67hx/kQ1QnJ3bGx/BtQ0bxOcf3DQdJ+u
	846w0vDCEJQKnC+/2qRxQY3pYJ58lnf0w4MSvU9vug/zuQEpELoQWs
X-Received: by 2002:a05:6122:65a3:b0:55b:9c1c:85f2 with SMTP id 71dfb90a1353d-563a09153f8mr172331e0c.1.1768332359020;
        Tue, 13 Jan 2026 11:25:59 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634d9162a4sm19010301e0c.15.2026.01.13.11.25.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 11:25:58 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-563641b24b9so1477255e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 11:25:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4x6v5HGHGOQcaNJuqKfkT38tvCmdIp7wl6jrBwBa8bXP+vdz+5hxZRkr94AVWdMALb2lhuE39DGNRPaM77XhOpg==@vger.kernel.org
X-Received: by 2002:a05:6122:7cd:b0:563:4a93:a5f4 with SMTP id
 71dfb90a1353d-563a091550dmr145996e0c.4.1768332358235; Tue, 13 Jan 2026
 11:25:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109125128.2474156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109125128.2474156-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260111-poetic-dark-butterfly-97993f@quoll> <CA+V-a8un48Gfqg-K6YToxUgnZawOcb-nQHsBcOfHdpAR7_Uu4Q@mail.gmail.com>
 <dd053cff-af8f-4378-9550-9f99f91cea20@kernel.org> <CA+V-a8tZAUoPxp7NanALW5HmVLMQAprcDXPME5povLT6nH6bTw@mail.gmail.com>
In-Reply-To: <CA+V-a8tZAUoPxp7NanALW5HmVLMQAprcDXPME5povLT6nH6bTw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 20:25:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrSUeOFvyX-RhjFV8HfiGtvOvBT-Wd328C4P-j-N0fHw@mail.gmail.com>
X-Gm-Features: AZwV_Qi5VDWrgJaVOTjXTW8AVFjCwxmek62R9X6THbS3twvGucCrR-aVI1pn-1o
Message-ID: <CAMuHMdUrSUeOFvyX-RhjFV8HfiGtvOvBT-Wd328C4P-j-N0fHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/T2H and RZ/N2H SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Jan 2026 at 18:22, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jan 12, 2026 at 4:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 12/01/2026 15:04, Lad, Prabhakar wrote:
> > >   - if:
> > >       properties:
> > >         compatible:
> > >           contains:
> > >             # SoCs WITH resets but WITHOUT reset-names
> > >             enum:
> > >               - renesas,rcar-gen3-canfd
> > >               - renesas,rcar-gen4-canfd
> > >     then:
> > >       required:
> > >         - resets
> > >       properties:
> > >         reset-names: false
> > >
> >
> > Yes, although now I wonder why do you have such case... There are no
> > benefits in disallowing reset-names, even for single entries.

Except that I have no idea which of the two names I should use in
case of renesas,rcar-gen3-canfd and renesas,rcar-gen4-canfd, as
the hardware documentation doesn't explain that?  AFAIU it is just
a single, common reset for the whole block...

> Ok, I will update the resets property in patch 1/4 as below. Would you
> prefer reset-names as a required property for single resets?
>
>   reset-names:
>     minItems: 1
>     maxItems: 2
>     items:
>       enum:
>         - rstp_n
>         - rstc_n

I.e. which one should I pick?
<grin>Obviously the first, so dtbs_check succeeds?</grin>

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

