Return-Path: <linux-renesas-soc+bounces-33209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCFrKkDpFmruvgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:53:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCC5E4751
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8889A302E903
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1117B403E90;
	Wed, 27 May 2026 12:52:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006123F431
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886323; cv=none; b=RYq/5p+HfnOVwJCvnBXoJZiBAi97fxqD2sBtyqK0ZFeE0p21iLT4exCmtvyDMp0sKL9cNhpx+HQwe/VRw9ciABRSMXjnx+fwcT8+FtKW6LMywYTKJaxNuvEkeFsxtoTA9TCdsGJwhAKifPjm0zRKg8vILdv8n8RIGsKwldRs6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886323; c=relaxed/simple;
	bh=V9RAf1GqqHMJtgbWs5i0yM5MgVagBGD839DyGgc8I5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1mOsE8j49dqv33T4xOEZAfUh1YYnuMMFfoOPPTTuECahhK2tGXIeD+XGwIDOsPSjlLejsusJjdttnMf5rTrXZrS5lw3Z+lU4SpdUfawKPErpFy3At/NBk8oR1hr4khOMPy9ESxext4EMQE51hUBD4YzO52ObBlPJYc2iZWwZr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-631466587e9so8780211137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 05:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779886320; x=1780491120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1s/jtnq+BOH84dbnuPCtGCz4Kb51mjTjZ/fcs+3yeQ=;
        b=SvKNsrBsY81SpzMLmJtFo+CBqbmjhmk0uxjhOKDS9h7f21AejgDbrKyh10TvWhzHs5
         s7BqEmhK+vPPb2tfFw+c6esG2OTlnEgYjqX/BK3MgMxzAeQ+1uqZRNK1VtKxfNhF8jVu
         RhXq3FVs+odPPwTfkLD+Pe3FyWGTQVC1dUpPm3K205VeFBG5FoLHjA5/5GaNQD2WAZgT
         LF5uZoPKoNZYDsF9sfdWr66j2tXiHKcIaNwiaHAbJvgJhjy4QVWIf007fYZjBXmzNlS4
         iZep8A3AQ+v75UxcjSdm1OzOhpobAEn1BUwXavACP/3AHYWoUPEcXaThXb1HFkkCWndJ
         Ul7w==
X-Forwarded-Encrypted: i=1; AFNElJ8VUtOnlkchpdBHD2NkpzxmsPNVDA0l+uzD+kMk3/9DXS25cbRJoBIyvoXJJjn8B7din/z/JDBKznc+/OQUoRr+0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3Zw7fdIwjJdT8ZQ5OQb9EoZvCWClR5rMyDQdzkXrXXU6NpLj
	6+rU0BFkRZzXZTM+zOoBbHYsrEqlA/Lgt+vz9/dUyCdXPnL+nUXHcfqd4vEqWVjg/90=
X-Gm-Gg: Acq92OFt4QsOuwXMTGkSLgHa+rjTBdARFOUVfbXAbkLTOSTsKrScnvH57iElPrleFWA
	ykYqplixLw0moWxBYM/z5ybFhZaimTjte+TjPZ72dQnO9+ucz5s/n2vC7GgAjw3rh5voEKzh4is
	oNDVGk1d4tNjUmlQPZ4F8XAqeF2f3ToS17AkmljJASjluQFwDK6s4PmQ7Yp3gEv7zq6LZlRKqkM
	yeZEFpyNbgYfzpCUMEBvS6kAyBEMlpzv1i/9MoELGx5LCWAxstuDlRMGxokANXsxIEY/0uu8jVO
	BTjqfDBCBJawq7Zshzfk5lyMNSToDTWcdNEMldInOfhaScEiBZDy71iG4r21wynGRMnAtzPssU4
	33b5kfxiQi/uZ6bCc2AuovwXuo5VUmLGJi+8ZhYYiMKxtunl+uhIa18CEuksGL+KhLSVsCVnkuK
	qNWEl4MCtvxsZq7QgA4vxhmdV/+nnoFU7RUrhOaInTPVWJyK/bxLZs9VneFCiQ
X-Received: by 2002:a05:6102:3ec6:b0:632:3bd5:d572 with SMTP id ada2fe7eead31-67c82ffe34dmr12207460137.27.1779886320349;
        Wed, 27 May 2026 05:52:00 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e499bbsm16674555137.7.2026.05.27.05.51.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 05:51:59 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so8244026241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 05:51:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8N9iHKnQ9o8f9XAIGwytwV301HzPWzdd1Uycztzfm3EJK4oEvbBrSYYn69sfy2EbsHeP4/TSTv50mXm/XHaqftIA==@vger.kernel.org
X-Received: by 2002:a05:6102:4b1c:b0:650:94b2:b209 with SMTP id
 ada2fe7eead31-67c70e65631mr13755724137.4.1779886318786; Wed, 27 May 2026
 05:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524092016.46346-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260524092016.46346-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 14:51:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbnK9LXKgaEpWCosUHLMGQzpe32VxaT4xT5P1FU43NLA@mail.gmail.com>
X-Gm-Features: AVHnY4K7PEhqL7l-y4HCxD8YtnX5gQi3Kk8WMoT27R9AZcbDgLwF3FI-H1Ufsec
Message-ID: <CAMuHMdUbnK9LXKgaEpWCosUHLMGQzpe32VxaT4xT5P1FU43NLA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg3e-smarc-som: Sort pinmux entries
 and fix blank line
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33209-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 57DCC5E4751
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 24 May 2026 at 11:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Sort the pinmux entries for both GMAC ctrl nodes in port order (A/B/C and
> D/E/F respectively) and remove the extra blank line before the second
> pinmux assignment.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

