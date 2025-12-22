Return-Path: <linux-renesas-soc+bounces-25985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43FCD62D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F419302C4E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B52315D45;
	Mon, 22 Dec 2025 13:38:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CD30E0C0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410688; cv=none; b=aT/12hqP5iOwqi1tmGr2SLAQP7hsZejq5Vfv99FvqVEW1/lHm+4AHpKith0b9khyxr37HQotuvDyimFkMpB4sR/lsPYcQfUrNEez7kKHHXQBsw169MOJ5/LzErHdPJAn4PNzamEvpvsRfjU+m2QLzqeNgbOUVDQaU4t022zHNYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410688; c=relaxed/simple;
	bh=atMu+NMNWGp92ZN8w0//KyU7iObU//7MOE5nHVDMOIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxd7AodJ6F1Cx31plnRZO5wraKU8EjMpcdD77s0rCXyTvRoB6vZ8OFgJCBaz9LlbUAC8uvCIapEH+IKOvyL/iSQIXc+ZC9m8hHbfvpJsLTuPyG4yhJJNIl0gNYqH1FoUgzzUsO9kFotXAVwzY7pLQwalHf87c1a2+buW0FT2WA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b09d690dcso1352398e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410685; x=1767015485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TH0BuDPZuMG5BFci+UieKJnAfdJDwgudNqJd8FC3hQ=;
        b=dGoytnSubKfgJLMT25DTo9ENRZ5wPken6MCLXdXax0I8xiJx/R8XeMJ0Cdo2w4unIu
         Khm0ou3htGQuKTTyzLxZ7zy6pfTrxR4egTysYsNSnFU4SS8wa3pc+w2j9grAKYHmkMpY
         56pei2n6ZM8nxmojMpOrkh8+yKm28ONfJA7wjdi1Mnbqntenemc+FrEStLyoGS78cQf4
         fWdnPcIRXC4zhpZOsDW+VsGi8O5LJoCyENShN/6ycujQqn4rb16OhwT2WSbYOD5+vsDx
         y58lLQ+/pS9yakPFODnaRQoRr3W+EoGwvDA4L/30kCTqXj/jM8sTeJXaUXKjCl0pb1XO
         pIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnRM5hwJDglpDZfcQX5ZHhDYrhuJLywi+jRoe3dmMAZQtREvNSg9zVcs7RdkIN19yIYtOxndmYDTRmpaxq1Vl4iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFPN9XPFhjgGIVHfs/pqD1RHT340U7svZtS7Sb9Wl46ogH1zA
	dqfKXpKTEkcLK9jNCKK1fc5elN3t1kId9WUQN1IcEMcpKTAgblJ95S0LFrYnuJpp
X-Gm-Gg: AY/fxX574+S8oqbBfuq2uD4jHamRVA50uS6xXq8pG6yYB+E+xt7XOy5231BvewpbBPY
	cknNnpAxLBoH//QXLYezS2/LFkRjCwt8+EWh/+85TICDuZaiRQS5m/DFngriiHIglI4Y7LQu3EL
	KiHgK6GSNv76qaDmTwyurWT51AA781haq71Pr1BvbEZJbJAAxHN7vXVRD0klASf1uhIVkhmSw5X
	uOHznfWU+FC3Ih9+/JT/QDGk08PSRlzB1qCAhHRXItdKcWLK9q1qlKyuTrgaPoZHIWTYzcp94Ev
	YE/xupELov6MVq9OUutp8iEih1NyKiMo2pHHNfT3Tu3NqBZ/KwclE2gqrveH72E0tqH9iO+BPJK
	rBZs2nu39XUVpP0p7/v90PDGBeiqAzSIFiiaEmp5y8pM67fqtVhoLyocdUOmCHSerxjXHo0dYF5
	yioYp9grImUDJkdojsDszU/eB/ihpe2nFumGgeY5PpsaCgjt0jJDsV
X-Google-Smtp-Source: AGHT+IE/uwCdJM2f7goNgmxetTZLQPl0+bANy3/PauIxorMZKW8kd9InL4gY5r+ekL5Icv8aLAOnLA==
X-Received: by 2002:a05:6122:3282:b0:55b:305b:51b7 with SMTP id 71dfb90a1353d-5615bf0ec82mr3746141e0c.20.1766410684845;
        Mon, 22 Dec 2025 05:38:04 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d165f2csm3368748e0c.20.2025.12.22.05.38.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:38:04 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55b6a642a4cso2696282e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 05:38:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeOaGUrye0PAXWdIDmn65yXYQi0g+m0NoFXJwP8LFr5Zg4LzSCRWRK+C48dOk0m8TC+Tcm+etsrs4gILOUlVh1WA==@vger.kernel.org
X-Received: by 2002:a05:6122:3c86:b0:554:b32c:6f76 with SMTP id
 71dfb90a1353d-5615bebc60bmr3088446e0c.15.1766410683522; Mon, 22 Dec 2025
 05:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251103200349.62087-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251103200349.62087-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 14:37:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcb1A0rOHgpHNUjOGTtfYxpf3Xc3a5wz2gs7_qq8K=kQ@mail.gmail.com>
X-Gm-Features: AQt7F2peHUmX0Fbl7hJ42VjvAfztqaghIr10Zy2HPLV3PPh7RJNBVjXW7tAqsc4
Message-ID: <CAMuHMdVcb1A0rOHgpHNUjOGTtfYxpf3Xc3a5wz2gs7_qq8K=kQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g056: Add DU and DSI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 21:04, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DU and DSI nodes to RZ/V2N SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

