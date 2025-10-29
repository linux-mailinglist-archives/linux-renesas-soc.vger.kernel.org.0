Return-Path: <linux-renesas-soc+bounces-23833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC939C1973C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 10:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DAF574E5944
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B785C32BF5B;
	Wed, 29 Oct 2025 09:36:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658632BF3D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730615; cv=none; b=TpgSi0Clo/ROAU25vG3iBQFL2Xysw9kmiWiPYbgPm1MGJbVs7jXtNcf626p4cVe4NfA/F/pCdNN0lPUn8HI70P3x3TG1IProu6iwacrh66QEg7qIMdWczPxgEca20qfT9OkECy28HkhSSUMbz54zWqZfftz95/QOeISJ+9A/0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730615; c=relaxed/simple;
	bh=Xpk2JeOgvEuSwfbH0jnkEUut5F1XxgoqjewZULVDRXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlujkmHwTln4HFIx56k9XpMHDkqiLPCHsyUas79wbIi0v+TWkGaRfVaSCsEXeQtjv+vMOsSaJTtV9oOk7GtFCNq06zixJil9J+ye2Vzm4FPE7bWXXWvGTBAY+hMhJc4QK1oGxFeUfUFhrfNNsaD/bZIyd/f+oO4q/KTEjUCZYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932c2071cf5so736932241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730613; x=1762335413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxTxfpohQi98v1awh6L14qg+YEAlD21qoa2xt+/HNfc=;
        b=CPLS3fWriIeCOtMhbkzp+tsJL1OSNZy7lqDEWZSlrQX/IYKiPbCrCMofHmMeH1m8AH
         ufBMmguZtr5ZCCLZufS7DJ/Bt1Fqv5LmAh51zjvFRBAjV1Q9obI+/aBsXmA2sYl71Tvk
         CCn643NTQfxjhXVUCL9mPaVRhyRR1nha6JgHxyZw2PyZhjH85wTecRv6mHc04o/y3cQk
         pL/4ILjACZB/+zI0QVZjiv/msNaWPMiZRa0nCPgWOy8EEaAeflqwSXSHspDpdc9v2EbO
         mB+DAB9/eojU14U4EmJS2pRAy04KuK4mPPxGBLufIuJmcri2SRprURUQnXEbryr9+Iio
         HvkA==
X-Forwarded-Encrypted: i=1; AJvYcCWPhuTAXVseKu2UrofkimUWqUnug6GSUBPUF0I0xZ5YcZ7CIcq2f/nRG8rytChR+AJke/M3t4O0dmlt9BGxOgvuNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOZZJnS5g28NIAYCpy7vt0M9XqOFWa7McMHQ+P+1Gv1VVkf4em
	w9GKjqGqX0PRtQKDiwRhJ5eO2kabhG5Uy1/cKfuU3G3UZGtIMfo3cf12pVXMXn+z
X-Gm-Gg: ASbGnct5l5XGpA5fXlL0aW1x7fFJK5tF7tYmllk5AeluYTRtLrONjg8vKgdEP/K/k9P
	jCXui8tOOrgkCRryhOvBXFtwxkNagXElpkyQ88wtatAIe8gApZ9ttbI+rkUUSSdhMXKppBK35IR
	HVnFtC1dwuFe2OkRmh49cWOsnyaQ3udeZSiha80CcCLJIRnBGQJnvR6qZzpRYJDgo/IMqBrGRHg
	PRoulUXHJw8Vrqa2lyXZyfouorYc2LPuzqKKDPBTQyOCk9YJbORFwE39P8TukdivpxOA4mx0DMw
	K43o+a0XUwWkEXNrE/qUffSKYF1RS6x3eHKbmhASCiZ85f351whqbvCrQCWuaQ8/xTE4sZLX0dV
	5bvdlzL9TkdNrU4lWUM7f+EciOSYMmLPGBjJFW/1tTdMmsC6k33AmGpSHbFuq3z43ZTGzCQJIvW
	fXFeWMDPPutTgNrRapqLk2p9NqWaQ5moVXv1ThJX9Uy2tEDX7w
X-Google-Smtp-Source: AGHT+IHgowrV7l2Ki7iyAXbmF1NS2UJP11ZY7Knm+yTFjUhUhuNSTlOskghVU0c9GycCK6NP7XSB2g==
X-Received: by 2002:a05:6122:896:b0:54a:a2a3:b16b with SMTP id 71dfb90a1353d-55803d5bcb5mr2416630e0c.3.1761730612631;
        Wed, 29 Oct 2025 02:36:52 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddac18dbsm5285488e0c.2.2025.10.29.02.36.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:36:52 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so1019409137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:36:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhnj90GhB45X8vNhuNOj87DeDzW/4KYBvNc1rzFlXDtsT5Sv0tBljibpbUu3CY0XdKZBZjELaabrmgKef6+C6aUA==@vger.kernel.org
X-Received: by 2002:a05:6102:83ce:20b0:5d4:1499:99a4 with SMTP id
 ada2fe7eead31-5db7e20513amr1674857137.13.1761730611332; Wed, 29 Oct 2025
 02:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com> <20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
 <878qguv8fh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878qguv8fh.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 10:36:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9sEcKprPjiA50QOWm7b_fwoEkuJcLLKg-srQxwJX43A@mail.gmail.com>
X-Gm-Features: AWmQ_bn4zl8I96oXq4Jv_hdb9Wh8qZxVBEYArLHYY_ExCYgsyZeCKhK1SbmQU34
Message-ID: <CAMuHMdW9sEcKprPjiA50QOWm7b_fwoEkuJcLLKg-srQxwJX43A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 29 Oct 2025 at 01:49, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
> >
> > Filename matching fallback compatible. See writing bindings.
>
> I think I rename the filename again, and it will be
>
>         filename: renesas,mfis-mailbox
>
>         compatible = "renesas,r8a78000-mfis-mailbox",
>                      "renesas,rcar-gen5-mfis-mailbox",
>                      "renesas,mfis-mailbox";

Please no more generic compatible values like "renesas,mfis-mailbox".
Especially in this case, as we know the MFIS mailbox on e.g. R-Car
Gen3 is not compatible with the one on R-Car Gen5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

