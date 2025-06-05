Return-Path: <linux-renesas-soc+bounces-17867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F598ACECE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 11:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30B23AAED9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD77E20D4FC;
	Thu,  5 Jun 2025 09:35:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88D91FC0E6;
	Thu,  5 Jun 2025 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116142; cv=none; b=SvO0gdybyBIS5Xcj6pymN7DFjUqcotsMt/Ek3PQb84JPnjDyM/jezVH/tmrgBJKQPy2a9+JeJ26S3pLOUg40N6wyPskxcL18EjTF5UGBdEZ8JqyjURx4Drw+2Kx1kynnTRI2loA/CbJZzfdIqGtxfGlXBg/NHsIwFbbs5MlD0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116142; c=relaxed/simple;
	bh=41xdoLYgwjf7/U5NSAunol61s4uEtSMCE6/g3f9z/Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmyucefYKfzSVwjsqQfMkA0HTMXvuOQghLFWfLZ8ki8nI4Lzo2Z22E4gtsq4P/EKhwSjk6Qp3xlUJipibixF3iga70Gl0+O0hgjGxc+k75D2ilZWp7hFFyd8XukUHQvmN0NNp5XHCuAoY9XA/ojGSzIpu0aHCskSEQs9G9yFGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a44e3928a9so8074701cf.2;
        Thu, 05 Jun 2025 02:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116139; x=1749720939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hvmofBGJWU0fBg7CanLjJTstjAP7Bj1UYUEtu64SZY=;
        b=X3o/HpuGysmMjX+FylDUDyoua7Og3apQefKPbCUYX1cUUOoMQqa35sTAUit/dCorfv
         DEUWUaFutxEu8ihThjTRgHYkIqW8QD/kqLBwArvUJLhGKdLClBrN2tlQUlnqyBdts5b2
         j/mec90blnTNYoxnmH0jj9leAco9jzEjhvZt5PjIS1PeuXmPbWg1+QWHvHdee/ZiG/wE
         w2PAJMkJ/KAvGXg9qWATxgKxG37XWhwYpAPdCSS7ooywaojmFy15yB6+yqhFhq8F1xKP
         IHgqvrLJgwVursn1n/mO/h5mnjB+Pu4heKN6iE2SJNgkTjj4peCaviMNkxf62IDbOBAw
         aoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1IuJKnNAKuOdRaH7QVLztK0gQMxAZziyf5YfblCZN7phGLSRUZXkcLjMLEWX2PdDvi8QKrwtAYx+b0n8oYKyZBKo=@vger.kernel.org, AJvYcCUNd8k/X0rezKjTw+llEdoeLEx7P5g3jNbSOg0YLaSKFzCB2zq6PWDuv9HQAm1MW6/UGSM7ApEOFGiY@vger.kernel.org, AJvYcCVi2vSbkz0BSJJdfTaUva4oJz+Z3pCO7686P2TDYkFwt77GXP6i9AMvSBdg/qpQFjXwmhHfhCRx5q5rLOvK@vger.kernel.org, AJvYcCWyw/t3k0K2D8PyB8k9oqw1xLby8wYcp6UDfcP4FV98vPPtcxeBXRdJ2qxcaJOV0VXZUY+UPQJt7asl@vger.kernel.org
X-Gm-Message-State: AOJu0YyVhvecVRHo3aVRMHmmHiW2HseEG2pQ6YG2hd32axS/hSgALEPy
	OwxXZDCpUrLW66oBxUgF4NeKex6UBlM/zHCeXEBT3HG0AeXVd5gv9hhLtcHZP0XEbmI=
X-Gm-Gg: ASbGncvhccnK66V1XU4znuvvQ5AUZoAKJgEuBJDctlBmqXrJZr47cNvh9gaIFxMNZXU
	Z7BOMV4WY6WiNrV982DFCNjdhdsxJ+wLKIs6R5qqU5oOiCNYH44HWXohs+/gPGkG6kuqs87c0Tk
	v46/nlTrKZCqWeHRBs32vVrOxR4nHQybvXaaZGjoOlDT0M6hm3yWSx+NvwsBLN+rSdL6WEFqr5g
	44wLEVAnhZUEQRH5SxWm1qVtaUAjrZGul8aEN89CxOz43brp7CemCfk6+cmzESmPdPLqSTEkqXI
	eTN4vBzqfUJ5zWXzFb5nZFPr98QmFh94gqguzeQqLWjDue+Ee6Bxn+/UwljDzgEX7g/bdizXDpe
	vm5udoFvUGMtX4A==
X-Google-Smtp-Source: AGHT+IHuDWR8tP7ztYGGajIu5TzQ+bKtjrMjZN8fbeA7jIcvIfiebWBS2Y+bpPs3zhN+riNdF6un9Q==
X-Received: by 2002:a05:6102:424e:b0:4e5:a93b:1d8e with SMTP id ada2fe7eead31-4e746e69b91mr5088549137.21.1749116128305;
        Thu, 05 Jun 2025 02:35:28 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e64e9bf9b9sm11213733137.20.2025.06.05.02.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:35:27 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e47c2a9cdcso554385137.1;
        Thu, 05 Jun 2025 02:35:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7LgbW/USyCBYlRf/66Za4INZqP5sFlvFnkuRL+sEuO6ttryfNSHBxvIABTeDMwQyLoNz5TWkj6D+LYJ1e+NhzvGI=@vger.kernel.org, AJvYcCUnIYZD4XCbG0iqTID1WjN/CuydyuGQ2jm0Pz+7P56GsdxCwartLqHgukcdMxnzf4ucvSC5Plr5LOQKIAkv@vger.kernel.org, AJvYcCW/7wKsfEWBbHtiduMJ8RKAsvporyS/YAmpSNujBjWf+V2aG7bE2v+UL+9py7j20QORjmDykpXgRWt9@vger.kernel.org, AJvYcCW0XZvVBLSxJXVFSG4qKI/xYlQtQh1ox/G+DXBZRD5l/LXR6oeXf8BhSG15Y0lagCzrffBTEBFPKwUk@vger.kernel.org
X-Received: by 2002:a05:6102:3a0e:b0:4e5:9b5f:a7a2 with SMTP id
 ada2fe7eead31-4e746d55340mr5054075137.9.1749116127631; Thu, 05 Jun 2025
 02:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com> <20250527112403.1254122-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250527112403.1254122-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 11:35:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOTiNcuGn4JSEAN3j=X51imvitgKpzSouwzjycJObbog@mail.gmail.com>
X-Gm-Features: AX0GCFvaO0b_R4fm_SnX43CLSVO9FEU7yvPaIyUxXCUyF3XPdQd4Fuz2Elg1OkA
Message-ID: <CAMuHMdXOTiNcuGn4JSEAN3j=X51imvitgKpzSouwzjycJObbog@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 13:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
> module has one or more MSTOP bits associated with it, and these bits need
> to be configured along with the module clocks. Setting the MSTOP bits
> switches the module between normal and standby states.
>
> Previously, MSTOP support was abstracted through power domains
> (struct generic_pm_domain::{power_on, power_off} APIs). With this
> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>
> Previous Order:
> A/ Switching to Normal State (e.g., during probe):
> 1/ Clear module MSTOP bit
> 2/ Set module CLKON bit
>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Clear CLKON bit
> 2/ Set MSTOP bit
>
> However, in some cases (when the clock is disabled through devres), the
> order may have been (due to the issue described in link section):
>
> 1/ Set MSTOP bit
> 2/ Clear CLKON bit
>
> Recently, the hardware team has suggested that the correct order to set
> the MSTOP and CLKON bits is:
>
> Updated Order:
> A/ Switching to Normal State (e.g., during probe):
> 1/ Set CLKON bit
> 2/ Clear MSTOP bit
>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Set MSTOP bit
> 2/ Clear CLKON bit
>
> To prevent future issues due to incorrect ordering, the MSTOP setup has
> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> from the RZ/G3S HW manual, Rev1.10.
>
> Additionally, since multiple clocks of a single module may be mapped to a
> single MSTOP bit, MSTOP setup is reference-counted.
>
> Furthermore, as all modules start in the normal state after reset, if the
> module clocks are disabled, the module state is switched to standby. This
> prevents keeping the module in an invalid state, as recommended by the
> hardware team.
>
> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - s/for_each_mstp_clk/for_each_mod_clock/g
> - do not add clock to its own shared_mstop_clk[] array if it doesn't share
>   the mstop
> - update the shared_mstop_clks[] before priv->clks[] array is populated
>   when registering a clock; this simplifies the logic in
>   rzg2l_mod_clock_update_shared_mstop_clks()
> - in rzg2l_mod_clock_module_set_state():
> -- in case the requested module state is normal update the register
>    only when the mstop->usecnt is zero
> -- in case the requested module state is standby and the clock don't share
>    the mstop, check explictily if it is critical and increment local variable
>    "criticals" if so; this is necessary now as the clock is not preset in
>    shared_mstop_clks[] array if it doesn't share the mstop

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

