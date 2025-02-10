Return-Path: <linux-renesas-soc+bounces-12987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F549A2ECEA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FCB2160D90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 12:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1F7225401;
	Mon, 10 Feb 2025 12:53:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DCF1C07E5;
	Mon, 10 Feb 2025 12:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191982; cv=none; b=MnqHKp8yOsqfsM+kdGaBdXkXrIA0jHIzKex0U0HhWoMFqnIaguO5ebTCDlzZjDB6C7xG0RdcWXsLfIpSuIuSG0ZC4fnN+EZjQ4lxl+Xsez9jths99PIuKLYEg0u/kK9CZLqE5SCkhuBrRKsFrcYOoQXBlxdv5e5P0MzWlOdrb5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191982; c=relaxed/simple;
	bh=AxPjse8PCufj5W0Mwc/HJq1/GA9jMRzqx6SV6iyBN+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ffwca6iYdVX11cgQcqRaD7+jYnUtg810bAmXtYEiNDRGPx2L6n2KUUKOWGTTZBt659cipZqb7GcJ7pMYXJjY0CWnaZepg8gkLIlS0ruiyX51KuLt0C8BfvdGnWSDavQdOXwgTakIya2MPFK5Kf9xJIjOXitcMTGxZa8xTbmaLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4ba830cd6b8so1090830137.3;
        Mon, 10 Feb 2025 04:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191978; x=1739796778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=venjWTFnRqOMp9V94AHkzmPtmC4C7DMCrpIW0su2Foc=;
        b=p+zyiFEBD0WDzH/6Xs3Dw/vBXqaqnNUxkr4mPqIEmz/hBSEXfDPBhnJ0kbULq48u+5
         GTdDPaFMEcEFyB1jZsCRhH8IBXXO+cAL21AJwNJ0cpxcGFFeFhpsFjEaUtphOAyqHMcn
         DVEYXo+vUjhJZKXZP9S4ZCFJDEBWAggZaL8rQNA8lijz9mdhr3KkjPf8mdJ1FguQ3F1e
         8e5pI4hS5TNjBFxyygdARF6sWf2nt2lDm0fhTFgfrti/GhqXah1ppqv8+I+lCyVW5zYd
         owiMX4maf7ZIV3h9ifQfRe8/kAxbcmXPAgTtlQMvQHBr2WG+sIxIl7JxX6k8V22zdeub
         Ll1w==
X-Forwarded-Encrypted: i=1; AJvYcCWG54oe85PHg/PUke3u/+S2WKRxFol5Xgg3BO5Kis3nBH9GvpARr1KgqIyBQil+K7vWP3FnHesyfZgnZkQm@vger.kernel.org, AJvYcCWwsO7ouEZrVBeXwFEK2F27rbFFRWhDIgI/9UiPiAT16waMb90Wc2pkEDhOo5EEtBwPGSt9G2QqaOYX@vger.kernel.org, AJvYcCXx7b/cjwnmGNsXmintzZ0pZXS1a9aO99uztVBIiRJoxX6xJl4IfMMUC0FOqgRLAlBhN5tJsWfAx+5QbgdiUMp3YRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aX7tETPKMFP5m4/brE4VlvyNZJX9bZpDNNB25MEeETIfY30D
	1VskI8bru0oULU1fv9qvCwkjybSTuTH2vw4Wh4gQyGdw+uIm4YKlWHt2gLDB
X-Gm-Gg: ASbGnctHxoJeQej5hBJDKXOo2cpz+n3fimLZB5mB+60CE5GZ+ZI56tVTpzqGnd6FtnA
	Mmk7YEtM1wpwZhpkXeewkThCEAQPtruoPfCa5GrJ/bxg1vjYs5/r+codD6opUz5rqNtU8L+vr7r
	mfCt8UpoFeEPqRcZKMDzHz8//fFvIJg9xTnTMYHY2MqsQcOmpUYhiI07Vhmiiyvw7iuMgSaTK40
	u8DRRZmj9azHd+TUBEcE87uyFny1zBqVMeQZ61VP+C/y40e9+RasG/dYkusXtgq76SP1KSSXJAc
	xVHfaI5aKJIWKEAtFkUZbGkyCyyrn6sb7zBsIjwHZH2ASIJN6tWwww==
X-Google-Smtp-Source: AGHT+IEhUFRVwTV7LJ3I7JM5yOoJcZRAixukJwJpLFvhWg6zGA0BPluL6qy3YTu25hObg/PQqLADbA==
X-Received: by 2002:a05:6102:cd3:b0:4b9:bd43:9778 with SMTP id ada2fe7eead31-4ba85defea8mr8689275137.8.1739191977999;
        Mon, 10 Feb 2025 04:52:57 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbd6cf875dsm135923137.26.2025.02.10.04.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 04:52:57 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4baf654570fso384142137.2;
        Mon, 10 Feb 2025 04:52:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+KBLQ8IRY+8vi4AtvfSyiMazTnM61rQfgGdrkmGRVILfqzC4zWxJ65ONa/0mRVvpwZmN6evVxAuHzsSWXtNA1dL8=@vger.kernel.org, AJvYcCVGb86aB5TI2VLNWfuNKjP7VMVVAM+/XcZTffldC9WB9yWo1zMVGKMNMGVbhLDuBA+w0WFJgJsSfJWUntdP@vger.kernel.org, AJvYcCXR549hzLO2jTnd6Wt9sCzxHj47bVemfKMcXIJXEqgGElSRl9IYlVJEb/26EH0hP7bHtcUkDaJ8byIY@vger.kernel.org
X-Received: by 2002:a05:6102:f0f:b0:4ba:7bfb:3bb5 with SMTP id
 ada2fe7eead31-4ba85f460cemr8022901137.21.1739191977504; Mon, 10 Feb 2025
 04:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 13:52:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2jbSmLGORg_j8TK8Q0s3O=2fFR0KhUhucNcrw9z7U-g@mail.gmail.com>
X-Gm-Features: AWEUYZnBvMCcy3PfEQw7avLAenpgmHanYKM-6qlyBFO9T2sc95Xg6F6Hwf9v4tg
Message-ID: <CAMuHMdU2jbSmLGORg_j8TK8Q0s3O=2fFR0KhUhucNcrw9z7U-g@mail.gmail.com>
Subject: Re: [PATCH 01/14] dt-bindings: soc: Document Renesas RZ/T2H
 (R9A09G077) SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:51, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add RZ/T2H (R9A09G077) and variants in documentation.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -535,6 +535,14 @@ properties:
>                - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
>            - const: renesas,r9a09g057
>
> +      - description: RZ/T2H (R9A09G077)
> +        items:
> +          - enum:
> +            - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
> +            - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
> +            - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
> +            - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security

While the part numbers match, the grouping (variant-specific + fallback).
do not.

> +
>  additionalProperties: true

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

