Return-Path: <linux-renesas-soc+bounces-240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D47F772C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 16:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46087281F58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 15:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD08C2E417;
	Fri, 24 Nov 2023 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxeD0i8S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BEC19BA;
	Fri, 24 Nov 2023 07:04:18 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7c45280b1a9so545944241.1;
        Fri, 24 Nov 2023 07:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838257; x=1701443057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/uTADgd8yavomJvu4FPF4hVWKDAN545TEF230idRIM=;
        b=MxeD0i8S8NYYEVgB1haJKRV+HjXNeZDsTmOdMZ73SjS5ppCihfwxQ3KL2wWKZ37y/p
         U83Q1YG4xjurx2DvWF1SKNlARyczBsocodPwoCZSmOrZBNGyrkeQ7IUI7067g3DIzs78
         HfT8iUMr2LDgEHOXmzNULE/2ULb10ODH8/EDIghasnYqS8nESvrLTNHNfGITP0xQd4pq
         HOkOZsv6Mit2M5CiBzBO4E3GRcpNEg3ON7oOu/8MBDsq0YPkK6KG9oYAKMSPsUY9DGTk
         CXWEmqF2lYQBCM0vtsVR+lsBls4U2UKRNxAP5IVxCwuywd9tiSiONA6OSYyfCPC1rdtd
         /KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838257; x=1701443057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/uTADgd8yavomJvu4FPF4hVWKDAN545TEF230idRIM=;
        b=U1PWTKIoTqWxiJpqXqg9uS9pOvDhozlvXEmzEAJvlXQxs4wDfhkEI/7nUwNZnSw/C+
         UCRNOPp8eXNNCTbY84JtvR/qq7qmO2ckLiVPupCginLt8xpg0O+zLzIWhakH47xfP3aI
         j3zcLofCnesZCgQptEyrwtgVdmwvXm8O1udb9LcLqH34jJvNPqtdJYT5zAcyRyFNiyW0
         Qo0thPcF3Dj6QuGSo+1MRaoRfNJ+/+Q2XlmG3dXCktY9X1HHLxIfIxqoEuOrLfFoJ59w
         HyV26jXwsWW0bdIewuurJcbYtQ7pksuhUTCl+RDCI7+K12wLWbj6ebCfSFgB4g+AlNMD
         noyQ==
X-Gm-Message-State: AOJu0Yx7Fpu07u16wovO86pmN6O85+PwC1qfY7MLkILsGnwrIqKDxKbI
	Yj0HaLtkmSbMqmAyXfP6LzNWOEDLyVLLaKNQ+lU=
X-Google-Smtp-Source: AGHT+IGn6rzI1NHfvj2S91FrsEfWhu1mpfJ9nScpB8mMaoymohn6mrpA57mTUjJApelr8DTsyC/emZM0XfrDO6gs3Qc=
X-Received: by 2002:ac5:cde1:0:b0:4ab:fbff:a811 with SMTP id
 v1-20020ac5cde1000000b004abfbffa811mr2973431vkn.14.1700838257213; Fri, 24 Nov
 2023 07:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-5-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-5-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:03:51 +0000
Message-ID: <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 12:18=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Add "andestech,cpu-intc" compatible string to indicate that
> Andes specific local interrupt is supported on the core,
> e.g. AX45MP cores have 3 types of non-standard local interrupt
> can be handled in supervisor mode:
>
> - Slave port ECC error interrupt
> - Bus write transaction error interrupt
> - Performance monitor overflow interrupt
>
> These interrupts are enabled/disabled via a custom register
> SLIE instead of the standard interrupt enable register SIE.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - Updated commit message
>   - Fixed possible compatibles for Andes INTC
> Changes v3 -> v4:
>   - Add const entry instead of enum (Suggested by Conor)
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index f392e367d673..50307554478f 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -100,7 +100,11 @@ properties:
>          const: 1
>
>        compatible:
> -        const: riscv,cpu-intc
> +        oneOf:
> +          - items:
> +              - const: andestech,cpu-intc
given that the first patch renames andestech -> andes, do you want to
follow the same here?

> +              - const: riscv,cpu-intc
> +          - const: riscv,cpu-intc
>
>        interrupt-controller: true
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> --
> 2.34.1
>
>

