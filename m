Return-Path: <linux-renesas-soc+bounces-31749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD+WK0/v8WmulgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:45:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B025493B3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE793300D963
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B112035F180;
	Wed, 29 Apr 2026 11:45:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1613EDAB6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463110; cv=none; b=uA1LDhp5coZKsNm7XMgFOaDZve0L4Tj0wDlGqJsGUxiT+hF9Ou0xWXqfZFpE3mcgiBU5nDhFph38HUmw60/muco6cre6THR8Aq6fVcXmtER4oKmi4gnJJ4rc0b+SjCTS/zRb3fAValk3tZCzRVj93v/Fys/ok3d7+m7gdlzoMVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463110; c=relaxed/simple;
	bh=k3006wJqxnTat9Xj8MW2QjrO2YW2+jD6t20DobBX4xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+DvO3SUeupCPXtPDOSCKE55tjJ83iUv9205qSRTtvJd00IaH6L8DhyyXRRDbqKvgT0xkAeILeF5nB3SDmHdrQIjC7TjPuAb/MSPWMpqoVanNEI4D+28Dem9K/iv+BF9EtG0MsxoEBVBuGRnNB7T+2a8QzOfp5L2Ud0POpngs1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f3e6bbecdso4198902e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463108; x=1778067908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07iUR/sIOeK9OY28Ao/jBJ40ezKJgRa8Xi1S5qNmXhs=;
        b=AHJlogOMJFZJZ12GkfDBGNsin+SxhFm7WSXaTw27VSDiwdrMu7/yYlC+2hbnCwA5U7
         LHFffT19kR4AzG6mOZsp8sII4x1eBu3awGqVrnzatQR3Kr2onvfVPhekvAGcUEIhNXL/
         2Zd2DlvWs+MNDPY3WSGnj7ZdXCLK/bY7jnWFrWVlZRvrkRH4qRo/kIkhdRJZWI8C04co
         fedpKrIibsIsLwDuiKswFNfGb2IkAwathNPefJHA1SUzt9aLuZWMt69Hc+b1vGxx0Vfv
         ohoY6RVKz7VobuJxEF8oiLhUrydapkNu3evu3yGTdBckgaefgVmtAyFys9CIItEDE8oF
         U8pg==
X-Forwarded-Encrypted: i=1; AFNElJ9EMLpHn4KJ8wVS7aFQicD2F5UFN/nncBMlNkdP5ozKSCd1qsPD8XoGY5qG79+NiSyZ3Wd9xv5NWfQDmRbDNhfSDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKUh57bJmQzp0SqWxpfRRTSovldI7eYTMx46w13tAvIS+Qdxqz
	NJQzBDoPto/rrf0zBLvT80r49AeNE7KV9UDLIq9beOMJSwZ9pAX9cUd2pyD1XqjK4jw=
X-Gm-Gg: AeBDieuGI3xXl99lG/xb9SDKfUQwK+67TlhGvTFCf2kppwaiWh7VXwk5slzQW7Lz9o1
	omuwzn1t3Cgg9dnIG5rv1t0q1ZY9QBr3tUxTK9OJgAFaq+2XAjDTto89tMjPTudfrUp1kRmfu9x
	7+m0YTyRrIyp2w8fkwWvpAf+rBoaaghBoMNPfmHtDc+BzrrrHbBD/DdMTJxW6LI5Uq4b19qZnAL
	LeKs6cyalz4qHlriHNOh1dTIiWKAvxB6RBDEvYOMDIQ32zKfTnyXytLM3sxZeiDnHFnv8CSDDSU
	PgktTeq1Vm7nGVcqr2PpfT5IPHBNm6dQvb8wIwg+73dwxGItZU0tisbdLvL48iq/MtKmX9zDBof
	7ZZsEjkMLdaU1dmZXjU0JUeD5JzHjBgDaaMmAegG9h/EO4KE94Z1LKD4Pop2wkCeSiWxi4d82Y6
	zmglRE75WbxtFHeUv+qqSmaF9Z1wXJIGXhbG8x+8lzs2OCGk3Su4ogIX7y8XWkB0tup6X2WBOLt
	MA=
X-Received: by 2002:a05:6122:1346:b0:573:ad2d:575c with SMTP id 71dfb90a1353d-573b36bf505mr1338851e0c.11.1777463108068;
        Wed, 29 Apr 2026 04:45:08 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6e2aad6sm918790e0c.18.2026.04.29.04.45.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:45:07 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5673804da95so4073276e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:45:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Wz8Ce2fDKOm3I+gKij05VyblHE8BINuhjDdSZQMXcdCKDpgCqwbToeU/EJoW9Y2nU8lbrhqdfFMK8YLpKpHUgDw==@vger.kernel.org
X-Received: by 2002:a05:6122:8b0c:b0:56f:7300:37c9 with SMTP id
 71dfb90a1353d-573b368cf79mr1448638e0c.10.1777463106983; Wed, 29 Apr 2026
 04:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:44:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
X-Gm-Features: AVHnY4LhTK0YHEkXOgViPxtDX3drSx5eXMIsHWPwRkcxiJzGfAV6beExDjAOpFs
Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3B025493B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31749-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,glider.be,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.538];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,mailbox.org:email]

Hi Marek,

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -473,6 +473,12 @@ properties:
>            - const: renesas,r8a779mb
>            - const: renesas,r8a7795
>
> +      - description: R-Car M3Le (R8A779MD)
> +        items:
> +          - const: renesas,geist    # M3Le Geist

"Geist (RTP8A779MDASKB0F10S)"

> +          - const: renesas,r8a779md
> +          - const: renesas,r8a77965
> +
>        - description: R-Car X5H (R8A78000)
>          items:
>            - enum:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

