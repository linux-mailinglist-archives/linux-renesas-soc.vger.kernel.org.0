Return-Path: <linux-renesas-soc+bounces-2851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7751285690D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 17:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7231F25978
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 16:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96EE134734;
	Thu, 15 Feb 2024 16:03:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F67145344;
	Thu, 15 Feb 2024 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708013032; cv=none; b=oyHnXDMepfibNrTsUfYnK+PnOr32ND0y4lESu5OiFLCQWQ2i2CiG3eRsuwoYRHANamE6+k3NNiJ+udZU/BPe8FbZDWMUlHsKDhQVtCX+LbbDgWbMZoi1vHneXleIaDOPg9v+y6JNz1ulUXRPimZCTmjEYsXdwn5nxf/BsxPRQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708013032; c=relaxed/simple;
	bh=hV9MxJcjm23EOX6eGaga79dWMWpuvzLq6EToYUusulM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzrnH9hBFhgYBhDeIDdPSpKcaXvGWVUSD+GAoHtvGn1gMhSD6Lv4RkF47AlA6CE1M4jmMUrtS+BUIgoRXTijE333JfH9Gr3Ex6FHHzX4MSCcmlbR+pIaZJHS4SIc0AalC8Ir80xPsCrxiMt6TbPZ2K7e54CE6eEe3oeuEgNbQac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6078f656914so10987677b3.3;
        Thu, 15 Feb 2024 08:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013027; x=1708617827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOKsrsoKMiggnztIq23XbGLOwUc2F18odZleUnfyY3o=;
        b=qrXOOa2SUpph3vgX+dbj7AN3XGkT40zApP8q1QMBdanInpbTI+emQlx71RMb1qSBPl
         UnD3MkqKerj5jqM8Fo4oQE9AJeMnRRG98JLb1EPEkZ2/FMl/L5gB8+S5zzhe9Ic4TEIK
         K7ariItqEo3+9nz9Ya9UT+HRMu6T5KDGXB56BriBMntKIXOeRodlLzX/gKBFathLTsJF
         V7H2sW+CoCGZnHv8vSuMXcsQ1ymbINIactpDMWWgWm2Ss5+gYl3LEoXEeBW1m7LIPzg9
         Y4jue57gX6pIToi/1qQoxkOBSsvovA1wIDKWSSNFdtRK7WHQ4pRqIvw/VO3t0yClqvFF
         Vi5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpU2btGl0TMUvh8fFiCPeep8dCzjdX46XnfiFaZhoTfA+1AO7ovgeN5OK19voyfvV7bpcNh0pXbgh/n850bDA2d60J9clL8EMRTfx226Ipo2MFoFJE0qCwmyLajGzm4UTljaC41QkniK4GXqOdI5mMzBt1ZcVF5di6r/3OuWrsonICPPmw
X-Gm-Message-State: AOJu0YyzkoxgT7S7JF1TZL+bnGk6GRBTcrfFZ1aZcBKg0g/rRHjJQpPd
	gDZeCPJ9jaHIoyz9EUyG/qq5Op36LKXjVfQysRRS4shUq45XHeP6VK7kDY3Qpr5aRw==
X-Google-Smtp-Source: AGHT+IFjn0gosnSbOGdcD75OcCjlwM1GzRSlhYFRUH39DW1SSSzwYnH8vQKc7wCJKgCmKzogl7oxBw==
X-Received: by 2002:a05:690c:82e:b0:604:3d5c:e1f5 with SMTP id by14-20020a05690c082e00b006043d5ce1f5mr2246710ywb.1.1708013027564;
        Thu, 15 Feb 2024 08:03:47 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id i204-20020a816dd5000000b005ff9bb7fa40sm300265ywc.34.2024.02.15.08.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 08:03:47 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so917292276.2;
        Thu, 15 Feb 2024 08:03:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTPsqXKhttht8egRVD/+/mAyzV8MLYY4dBv5eNRyZigh0CWVdAmlxKVdXwg9wjvpL1uFZRVR1dihdSF360+LRDqEq5oPSxRboCEx1uLkExdD+CNCTMMjFyRyoacFXtoRJaov7Q4vc3Ky22Mrtlohm0B0bATwrNUAtfi6EQFGIdYeniH6YZ
X-Received: by 2002:a05:6902:220f:b0:dc7:6d9a:37f2 with SMTP id
 dm15-20020a056902220f00b00dc76d9a37f2mr2694796ybb.38.1708013026518; Thu, 15
 Feb 2024 08:03:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121183738.656192-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231121183738.656192-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 17:03:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_CxNu-BF66POeqKv1_=ujBp8Z=cT=08crFxhgQ+gZ=g@mail.gmail.com>
Message-ID: <CAMuHMdU_CxNu-BF66POeqKv1_=ujBp8Z=cT=08crFxhgQ+gZ=g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: net: renesas,ethertsn: Add Ethernet TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Nov 21, 2023 at 7:38=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
> device provides Ethernet network.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch, which is now commit c5b9f4792ea6b9ab
("dt-bindings: net: renesas,ethertsn: Add Ethernet TSN") in v6.8-rc1.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml

> +  interrupts:
> +    items:
> +      - description: TX data interrupt
> +      - description: RX data interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: tx
> +      - const: rx

What about the (17!) other interrupts?

> +  rx-internal-delay-ps:
> +    enum: [0, 1800]
> +
> +  tx-internal-delay-ps:
> +    enum: [0, 2000]

These two should either have a default, or be required (like on
EtherAVB, where we couldn't have a default because the absence of
 these properties is used to enable a legacy fallback).

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

