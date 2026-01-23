Return-Path: <linux-renesas-soc+bounces-27354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APqeOcGEc2kDxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:25:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CD076FF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E7203001A4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5F813B5AE;
	Fri, 23 Jan 2026 14:24:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D229D3B2BA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178299; cv=none; b=LIUaH+jaAHpjBJIymlSykhPWGblPX/nRTK3cZNVIXZOBHMLA56i7AvaqQYVt4YLnOkoRt7JrmAtKiFhNS7ZJaoHyjk/Wpm9mT+iBKwjvLdUAd1noC/etreby84+7pK31rXefi/ACZK4WgJRIDAvPc1Ney+AivH/RpEpANcB36S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178299; c=relaxed/simple;
	bh=r9HsTXgn1GaeqU1gNHwX8oVvaVI1l0Q1W0dpN3P42O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2f8uN2706+/n24HB7FLIwOsMzBPzM+eAPnLal+wh0QvHkx0ZWLWQK1T9NsPJK+LZEgUJUL35qEKtMYY26mHb/CVCFlbFajHvdEI0PtL0p5gtMwNJd39F76HzaqGcp0hXqKk7f7JH+UD72q6ou67vse2Jq/s2GE/f0935TELL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5663601fe8bso1785621e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 06:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769178296; x=1769783096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLnfjU65RvqkFmzX5x5XUooORBFON/JkVFQYLPFc2VI=;
        b=E/cJagPKcroGzwpluFwa3Tq236kSBw+3d2TkABhZHocelzM9HjtmWt4B70JnOjEGnX
         Bwe0zTJt0Lf8glfACYUA+noJ9/CG0TNd9XEcg/zNrQQD8cWyhbH8X7A33RumWuZwgahZ
         udc6JRsQSsiQRIhPajtNoVfGWfe13wQDZYz4jroxFtgQF9QYkOywzajACMR2F2lmUnnH
         DApzNR9WCIJXuK+Dn8Cmj1iZqaERLu2Sn6B//iichpRyoPpyuCf3QUT3HDdkk2LXexbF
         DUMeIl9817T4eBpaAYVLXIgCdhmxad/N3M4XaShFZVdjhSabGH0gSS6pxXkPHq61YOAk
         TijA==
X-Forwarded-Encrypted: i=1; AJvYcCVm2+2GpQnx5A05spLTmsC5hXD+AFJx2bDmlPWB/TdsNEzW1yqlPhNOZY+mF7j/Ii/zG4amFLMzR5B8tvuFQtmWQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSH4bwFwZifBgYNw0aWZ8JQ469wJcV1ak3dBExjv71qGXMyf+2
	DGuOVLlnD5GuLXMyh9Y9BsRJD285dR1WbK8S7jCXzy7RBD/eSMHXfEughxlGW98L
X-Gm-Gg: AZuq6aIs/JdrsbjeGx4bFO4mURm7sUoyqIQJ1RIkJAJb0k91JL2zZS9knycDunaK/Gu
	0ugL1a5orysP0yTBgCJ9iUhpP5hgRzfcprvEzhdjMZijJBeZm7hA32Z/FGPES6B2aZuLb/Mo1aG
	CZUeondn2JmC+Y48Fp9gRGFDfEcIgjOHUle4WlJx32ZGqCNiWfKgGlpfXNYWmNptJ+D5eAvGsTm
	ZLyp+Evd7sOK8T8lXpCBIWta9AVtEhPi3IOJvkK30RDCE2JUoauTP411rrvaHX9KuzXO4mtC9eg
	yzJ8DzNgQmYXsdxpG4Vn76s01L9gVEid5F/Ao6cUXR1qEkD1bAxdonjaJlHHi+7EhaIiptR8miJ
	XbDaaUrFcVKN21CwBLO0qH+o14PUEzoFF1UYvXkpPzvwySC78DL7LXdvBlsnSdNxvcBX9jaTv4C
	FHs8kftz1djsxtcJbEUno2SFuWQyMHTBbzyFU7aw7XzWdVhHRqmowyQZJiw10=
X-Received: by 2002:a05:6122:3b14:b0:566:3748:104b with SMTP id 71dfb90a1353d-5663eb87de9mr910468e0c.16.1769178296593;
        Fri, 23 Jan 2026 06:24:56 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb584e0sm555405e0c.14.2026.01.23.06.24.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 06:24:56 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94120e0acbeso1387781241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 06:24:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtqMGQHITmFcjmG3QwbTa6zzgjR1KqbPd+ppu+Do0QCd384fW3bWmRoLXLrC09BeSfK/124I485xww9GW3fhZt3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3f0f:b0:5db:1fbc:4462 with SMTP id
 ada2fe7eead31-5f54bcc01d2mr1080831137.31.1769177859213; Fri, 23 Jan 2026
 06:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com> <20260123140031.94752-6-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-6-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 15:17:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxNbJaDhpOsJRCkDWvqqu4e63Z+cMRndFA6F+McdbuRg@mail.gmail.com>
X-Gm-Features: AZwV_QiB25G7U1c5HmJJDzyb95Uh8yyZZslQ3E5dHn2oE_aXz9DOubj9nIVp0gs
Message-ID: <CAMuHMdWxNbJaDhpOsJRCkDWvqqu4e63Z+cMRndFA6F+McdbuRg@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix
 typo in interrupt-names
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27354-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: D3CD076FF3
X-Rspamd-Action: no action

Hi John,

On Fri, 23 Jan 2026 at 15:01, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Fix a typo in the interrupt-names property description: "ser_cor"
> should be "serr_cor" (System Error Correctable).
>
> Fixes: e7534e790557 ("dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -42,7 +42,7 @@ properties:
>    interrupt-names:
>      items:
>        - description: serr
> -      - description: ser_cor
> +      - description: serr_cor
>        - description: serr_nonfatal
>        - description: serr_fatal
>        - description: axi_err

Nice catch!

Looks like the DTS is actually correct. So why wasn't this caught
before by "make dtbs_check"?

<dramatical silence>

Because "description" should have been "const".
The same is true for clock-names and reset-names.
So please fix all of these, together with the typo.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

