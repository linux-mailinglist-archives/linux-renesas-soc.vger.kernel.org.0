Return-Path: <linux-renesas-soc+bounces-7560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F993D635
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 17:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EF61F2207B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E4017BB0E;
	Fri, 26 Jul 2024 15:36:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8710A1C;
	Fri, 26 Jul 2024 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008187; cv=none; b=nPjpKJbNDWXSQkeBYjBQac5X3AUR54+aYwI+FMgWSj7Y8mh6NBplOpDo0fR/LHS34ql79k+kI/DZm8/HzNmk+E7LtxOJdy1wvUB3XKU8FiUcRXBc/jRep3RYOFN8GhNJMi3igrWMVvN7aLtsuR2RhfaRnNueg6j9HZ1z9lcWDyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008187; c=relaxed/simple;
	bh=jtBCQgAiSBQcOttW4mhJSzqp6bBcYYThL34Lj13e1R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sK+O9gM7WLR8uimFPWWg759qAQma2fCWf6b5vnh8CnRUZIGJESJGXihCazfzUCykl2GX/sZiY8MP4kq75yCgj158qhcebyEI4RCZkhHFlOE4tRTLLiPFSV6YrffKeCOgoF9MQx3zhzTh6mZh/1ejsSudV4RCfVTW3LDrGJEMxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-66ca5e8cc51so26721907b3.1;
        Fri, 26 Jul 2024 08:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008184; x=1722612984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIvifcKMIEG61HG4YToKOZ9Cti4XXXGmxfNgxeY28XY=;
        b=nEUSIOgaEJYI4SDgU3yatRweViyhpVslLsUIddCCh2y1ib9SLFkSDwiMALu+vFCacK
         PmfgO1ZY6CYj3X2+aB/3OU+p2x9nyw3phTJHm7zFOoH2s9RD/KXzCTLL1b/ptVc52O4R
         VU8lH+qmBRGQ5wxDRP0qTKMEFI+ZjnKcf+pU9fPWN8hejZlc+kRuIEvkodDrvoop+KP3
         WBLmEDmmOvCb2zdpoF1u42t8bTsTy/PmiL2bAc9QGfeohPkwNJFkDMRJ7JvRAwOSnbrj
         D5sw6qCipWcPdsEiZMkElQgnPgI19cUORbofA/x23H9DXyILDh+uDhhI1Y1wpHbxrbiJ
         hrzg==
X-Forwarded-Encrypted: i=1; AJvYcCWWGk2ykVo8o45Cahlxj3evUunuFaAi53I+2TjIl2sjHuSSYE0vXj2EqYDzj1dBGtnzhp6k62bySLvcjq29iz8e4GX8XQPHfVFDG1svYV0fz0S9hLiWJJWx3bZ2BP5Tc8IPpSbvaeVrf2oMAy6h
X-Gm-Message-State: AOJu0YxMtfp9+VjXoEYPhFzyl/Hu9IC+oZtJV/SFSmstIONK1Alevp5e
	cCZYVyTkBJKKsmxPSHHcK0t8s9E53reG/9EPDIHVXlhODBIOy+3Dc6UtMYbFbsw=
X-Google-Smtp-Source: AGHT+IHyoP33kIuYHlBaQbHZUGoLVDp67NFAY+Mo1Sq0ZpYpMbGqwQoNBwrsYj3AvkLFGIL0hA711A==
X-Received: by 2002:a0d:c806:0:b0:64b:52e8:4ae3 with SMTP id 00721157ae682-67a053e06d6mr2078627b3.3.1722008184240;
        Fri, 26 Jul 2024 08:36:24 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756795e78esm9330227b3.43.2024.07.26.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:36:24 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b417e1511so21373137b3.3;
        Fri, 26 Jul 2024 08:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1AiW5XfcPF6acvMkiRx7wmKwo0x56FE+McucJQOs/f0Pkzal2nDqoVcPAvcDPGz8zugQV1+e2U7OmmAZuE17ofz3Z/Aq68sd0O3jTzciaOE5isVNlnIhwORGjE1vV+Zmd9rQqnGXEdpx1oGli
X-Received: by 2002:a0d:c806:0:b0:64b:52e8:4ae3 with SMTP id
 00721157ae682-67a053e06d6mr2078387b3.3.1722008183878; Fri, 26 Jul 2024
 08:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com> <20240725100534.5374-2-oliver.rhodes.aj@renesas.com>
In-Reply-To: <20240725100534.5374-2-oliver.rhodes.aj@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:36:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCzDPjthpMYHwq53HRJpETQGZ2ZydfiT1zYJk1ff-aBg@mail.gmail.com>
Message-ID: <CAMuHMdWCzDPjthpMYHwq53HRJpETQGZ2ZydfiT1zYJk1ff-aBg@mail.gmail.com>
Subject: Re: [PATCH V2 1/6] dt-bindings: soc: renesas: Document RZ/G2M v3.0
 (r8a774a3) SoC
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 12:05=E2=80=AFPM Oliver Rhodes
<oliver.rhodes.aj@renesas.com> wrote:
> Add SoC documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.
>
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2->v2 resend:
> * No change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

