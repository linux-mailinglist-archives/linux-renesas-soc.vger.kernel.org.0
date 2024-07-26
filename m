Return-Path: <linux-renesas-soc+bounces-7561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB1E93D63B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 17:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2FDB284642
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A8B148312;
	Fri, 26 Jul 2024 15:38:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0AB10A1C;
	Fri, 26 Jul 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008290; cv=none; b=a4Kp0ZaQjQFQKU0avuXWGTLp3sSFOHcedRJEe+BN79wg7JqaLLh7En9S66T1TbUv/uTg+c1j9zFcrYvor6aop4Eu/pb9/2hAViFx4RuVYML4oGZ4tf+eIwgCJGMW5mbLld7cHsfppjaK/L/9fmOjB00607pzPjeiEicQLsPBjr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008290; c=relaxed/simple;
	bh=mcO78tkBOo/5v4K5+ruMx+yn3GIyWeBqU1WqcegV2Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GufOnxeMKkBLWgI9b+ovdoBZ/X5csayVmwf6yesMyiwCArMUVPiKsj0Uof4+AXUDh+4LhympWxRnrk6yAX661kmTaf/MoTGlQeKLdWYRNMYnWYleWRW4xR9xTrtA7iN94+MSpTiGO5HcmjHzMZ5qxpJk45QDbDyag/jVwO1wAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6659e81bc68so23452897b3.0;
        Fri, 26 Jul 2024 08:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008288; x=1722613088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRA6wjZjvKQo38Lbs/09LuwfqTTU5e/8t/RIuqoaurY=;
        b=C6CzZZyyGAPbF3ENGkbppY5x8a4aWfNSJ/VQY/rBA3b9l435PmCA8KfcIaUPEkyg0F
         meE0XTg/aoCxsW2l9VoIa0ZWj+jofQ0R4H3GcgeAEoLUPrT33UlP/chCJJv29gtLmsnp
         D02HwcbiC2IsL41uWHhfqZCICNWrR2UKGdtRIW0dK2IG9grivv6cQ0r6NAMvAUTg0s08
         CBM/TMn47zalANANkEJ8ALo12N60KWBlurN8ok7EKFG5u5PuebjHlkpnLJF9nhadWhv3
         yxy43MAog7tQtbul97XkNTHA1DgUJtABIpmHLpgMcSRk/Smd7xK/oOt1jMMejdlUzfaW
         aXZg==
X-Forwarded-Encrypted: i=1; AJvYcCU1WaJ9gddcZQQA/miJp0guJeOaXQw84/LMYmlOJmgSshT/eb8BmTQJ9IQxZgGY7azzP87lRoApABhTjQe+JY3t5DQTn6Uc9LZ+OzX+5QISFmzYf1PwEju6PxB3HR5IgveZexhTEKhEdjCE+yZc
X-Gm-Message-State: AOJu0YzBTyO5v6qtLfu8EQggbyvp6KHOvFEqHNW9JXlz9WEuyHJfa5ho
	FuZwZxMN1mXsRYhN6HxjQd5yV31DIFC6ARrWSzVrIK5E6Jg/0vYZbSLVbkdpCes=
X-Google-Smtp-Source: AGHT+IEE1d0ZlDHuncb0UFp8tgmTg8Zg8Um1IIOxf1VwC9l08wZ5o/Yn8sksXaJVxeX1cOydUhnPHQ==
X-Received: by 2002:a81:9e0d:0:b0:650:a5cf:ef5b with SMTP id 00721157ae682-67a0a7fb78emr1574317b3.43.1722008287663;
        Fri, 26 Jul 2024 08:38:07 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566dd8ff5sm9170947b3.25.2024.07.26.08.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:38:07 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6678a45eaa3so23082057b3.2;
        Fri, 26 Jul 2024 08:38:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+/YX6bS356iNdMP2s0YfN6jfS/hH00WJb5fuLw0RWXTjhLj0Omdi6vZe34MMhM/4zgW/CSC6vRaN/T3Ub/ITKrOlPRyEMB+ay4TVqgpdFo+kwXPiLuUWvNMo3RZhKvyyGBsEhAlEHICua8lbl
X-Received: by 2002:a0d:f3c2:0:b0:627:d23a:4505 with SMTP id
 00721157ae682-67a053e06f5mr2458237b3.3.1722008287278; Fri, 26 Jul 2024
 08:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com> <20240725100534.5374-3-oliver.rhodes.aj@renesas.com>
In-Reply-To: <20240725100534.5374-3-oliver.rhodes.aj@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:37:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnULCJouT0sVt2V=TdBjbysy5C+mzPKSbo5e4gAUq5Wg@mail.gmail.com>
Message-ID: <CAMuHMdWnULCJouT0sVt2V=TdBjbysy5C+mzPKSbo5e4gAUq5Wg@mail.gmail.com>
Subject: Re: [PATCH V2 2/6] dt-bindings: power: renesas: Document RZ/G2M v3.0
 (r8a774a3) SYSC binding
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 12:05=E2=80=AFPM Oliver Rhodes
<oliver.rhodes.aj@renesas.com> wrote:
> Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SYSC block=
.
> The RZ/G2M v3.0 SYSC is similar to the RZ/G2M v1.x SYSC however, it lacks
> the A2VC power area. To handle this difference, introduce
> renesas,r8a774a3-sysc compatible.
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

