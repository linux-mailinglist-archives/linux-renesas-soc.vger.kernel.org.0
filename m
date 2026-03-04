Return-Path: <linux-renesas-soc+bounces-28749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMRDJPfsp2mWlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:27:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325E1FC957
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34B12300F97C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 08:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749423803E2;
	Wed,  4 Mar 2026 08:26:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B97A2FFF89
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612789; cv=none; b=hhcNVkZg/iUyD/9I6jyi5zme1X3kWMgVVdobqrEL4myvh+DawGMtUzEhQX+m2aNV01fSoawgB4FKBwqLgvFVnVbpgnYd126rX9hj79wko0jKVg6X5voVCDOuHkToRNtFFDcgeiVSJQdXrtRhhmJHUI6tw+edsKa1Hp4PT9BHFVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612789; c=relaxed/simple;
	bh=h8XMGF2Nc0Wk5EgdvrroEbAApnFXmPdgctli42asdYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzPJ6zSlj6j9X3whXj9REuleGh1NDLQeCj3mc0RCiwoszoHD8QsKbux4q/p6HY0eeq22fEnSfkiINvuWMGWa7006X2XUo6ENr0b1ClYg81LKey455Yq7KcMnsKLyY+kXufJkTUNcmn5q/XTPrXYGnZNGLpwtEnXZJQxKnf52Nqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso4289641241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612787; x=1773217587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3+VFmHycQmnpxwgU5v7FKE8AGsgIgJ+PuC8lbHiI68=;
        b=nNU3biJqJ/ZxIJ6QR8nb9m8f7GknKRbkp2riNzPUxVepUWvmiSPVU6r9bho5oF2feD
         qhHhTTXFMCKINt3+Tm62f9kjUEmr89FAKk77LExkXhjRggvRJNOjMrqYlCRzwVuSr0Z9
         PH6hvY3mNReyFrvucERA7v8SiowQWhg+A9gVct6oFlzFyhoQYNyUVNUu1fxYiSRh/Ff9
         l9aK/JlRrVKq6SiOvUBGP8ZJbLDH3dqMNW1asRZVZ9qpQQ9A5RvHsyamu22ine32LPs1
         rYPPmF+oSWZHOiNkT77M4WOgU6NT+97ji723jz1njkX/0dL/nWUW24GXD2Pfd12eMBjP
         khXA==
X-Forwarded-Encrypted: i=1; AJvYcCVOh/tEQVzJM5Pwy/wAzES9YxdimLi8KGPrx8EP2cm/nq3omX4Rs1Ay8ugMces7ghp33J61vk5FTZhe2Lhib1Wobg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xuSUYUqCl+5yWzb9lL13rnC15mUtRiaUfybFj/QkrXiJNIab
	cbfo5oeDtfPXGfdKrNLx6nl/RT8jJ9WzJ6BVv6CDkw5k0CblNkvVAdU6dWd/P2IC
X-Gm-Gg: ATEYQzyYaAkl3qfm3MPUMmxOROGNiCU9cEPS+D91oavLAHkCal8M2M8BRmK5o2Aqp3y
	KOuvKHra3yot/zRng5Ve2apURICiEhDTtzkSXNd045gIzwCIHJUip8ANb298RUUog2CmLj69LWv
	DBBpaheUjWkoynHWFnFAotYrRnUb1HBPxlLuQ0KbclIAnvFM7uU/WVhRV66jSQjt2wK/me/fUH7
	slMv7VcRqMHFX6k05X4tnAV6y31NKG94X1GCeKB91Ta9OyARI6tXjo4z7XZXBIHQjHmi9JK+d0H
	eWZSmF00eJrZnpzsHXxQ3M1FmEey2PFYpAl0KOJkhu1HXr6V7dFUTu/DBtsHxXillMl0wpJAdam
	sFTlI0VX/PmOnk95vvodroyAM4+Wv+hWPdla9nHQmWiWUtCvyL1O0JWSx2USHjtr0rHN/70UeZH
	S9JqZJRwXwvKFLei6gQuVGjULdtcLZcVkgst6uAJPjScjyrmUGGNLNWJDYZKvz
X-Received: by 2002:a05:6102:c53:b0:5db:e77e:7828 with SMTP id ada2fe7eead31-5ffaacdf4a6mr597197137.16.1772612787261;
        Wed, 04 Mar 2026 00:26:27 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7aeb8dsm19601257137.2.2026.03.04.00.26.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:26:26 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso3635511241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:26:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDMu/+TN62sKVFZ3749o9bHB7X4tMwGn5QKjLOKs2NYiUcZN7dt04hoFnTF1jch9c1Z6JaaXLNPz1JscCd2fteLQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2912:b0:5db:fddb:3155 with SMTP id
 ada2fe7eead31-5ffaacf3fc9mr537566137.17.1772612785608; Wed, 04 Mar 2026
 00:26:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 09:26:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaDnwBxFN7XR+vcmdDu9n_-y7cq1UFA8nR0B3tmu=SaA@mail.gmail.com>
X-Gm-Features: AaiRm51tHA7vv7CxCQHJyifVVIlgZqU7CnJj7osvAWnvWvTbWn2sw9LUaMtIXz8
Message-ID: <CAMuHMdVaDnwBxFN7XR+vcmdDu9n_-y7cq1UFA8nR0B3tmu=SaA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: soc: renesas: Document RZ/G3L SoC
 variants, SMARC SoM and Carrier-II EVK
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0325E1FC957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org,renesas.com];
	TAGGED_FROM(0.00)[bounces-28749-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.454];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document Renesas RZ/G3L (R9A08G046) SoC variants and the Renesas RZ/G3L
> SMARC Carrier-II EVK board which is based on the Renesas RZ/G3L SMARC SoM.
> The RZ/G3L SMARC Carrier-II EVK consists of an RZ/G3L SoM module and a
> SMARC Carrier-II carrier board. The SoM module sits on top of the carrier
> board.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

