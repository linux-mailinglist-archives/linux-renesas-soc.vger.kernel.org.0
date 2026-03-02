Return-Path: <linux-renesas-soc+bounces-28668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +19xDuHFpWkZGAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:16:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E561DDA59
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C7143007F4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 17:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E4F426D1E;
	Mon,  2 Mar 2026 17:04:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA874219ED
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471092; cv=none; b=X3JORN/xVQylEAWNh9x1tmq1wvymRZttf4YAlYIyVCUKF0qUVxQfr15aXk7AbsNPG4uFcjDp9aKv9bND4ewIZJlO6jP2uLYkJI1eu4SbKDw+PpeSw2t6CT3UoLlsloD5rAAs1VLrEw07k8CKoQE4MEqBVE9maQuMGygEwY5uawI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471092; c=relaxed/simple;
	bh=qaGeRYQ0BUqSf7Y6urkZwpvwxyjri8oThgyLxwvpA28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyUc+HkRqIRHMBvOvsTBkKhmHocJMW6F1pwAlNtA5Y/mr5qMm+t/XywHLv+GXJfkfXf6y41UhZkoCgf6qbgSfNbrKd224EnXy84NZoEQYliOG382W26PprN9M+YQzSUdfwj8WZXlLh5Zjp1S8ruz+MrYCSqaY/U+wNFkYco3x2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ff09bb668cso3127958137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 09:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471088; x=1773075888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7Rb4SStTbY2ssYTGOZVDVAKtLBD0jhzNkwlLVMYXao=;
        b=U5AUuKZ1I0M1xtujrY6WkmVkgLujcxz+AhIK6H4UDxsrsENfLVWuvOz8Yf1adsz9zu
         DMJ8JvAsRJ/EIQ8hPrjnfy5xxf1MwUfzHiHCslOPSl6xYfAM1Nl+0eW/Tl3lbnXZvBVt
         wm8/GMyKctbXKABYp8yITplfxZIa+3aamaLdLFjDUvbsS7gTI3FqQkWzVdXOAtkXFltu
         gOowQMdX348s4PvnrXq7mW9DGgHpv7dqyplbr7zLvKm5qHbVOkVrOG0zRcC4h7bSsThE
         BR+IuE4VjYonSmd/gGXkGUVW+IxjZJInNVj8eVXtFnhMvEmOFyqWDIcg6QMO3qPfOvAm
         k1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuvnssMfhKekLeHBod9E4S+clKm0l/MRpq/XO/DH7JT2rBXKb5Y8hhoG3RZ948uLy7Itmd3z0gWUDqOcRDRG66Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3VzYvV8QSqeHTY/f79C8y9ALqlFvqvXlTotjMPNL63mGTSqj
	MgVdJWz14LK5wgzGyo7kE47VXKLadK94V/IVxRi80o+T9q84L+9aZPw3oQqZ8s/0
X-Gm-Gg: ATEYQzzsUDm+cN+32pOxpx+blVhP2o9sAtkGQFyElQObngDE+MuMZRZ8GJqdtln/wDC
	t01SCUe3z8/1958ona52PbeX0xSGaO6qdgSzs1XoInsSQqya8e4TYh43DCTB5mFQY7dl/SbwL+9
	woadOa9yu6/guyTtiuCnOZQCIjOwf/mv6dVVR9ivsfjuk08YEwRt3xQTm8pWjfwpYZUoxUMkE1M
	Hvwj6DkJYTaDOENvUoHIq1SZDUIMV/dyslbTb/Aeke3OjU5lxgzlQCqsVgET+wSOA87NK67vM9l
	+6C+oX8PRCqSKYzZC9raxhUl+WaIekveiMGTEwVcNU5f4SW+Lf1C0yRnJcnhGOrjs+ZjRW1ZVfU
	nYYiy5sH2Bl14UBJkpJHhYICpDU8IAPdJRwitr+qWMMJqKWhNvnRa9SdZ3fg6M1fOPQIQnq6+Bs
	EV3QMKN3lEiQtlbJqwDGAIOVNwuT1B7E6Iceuf3mHduvJ9jTYwDHY9vub5Mr3gTE+oRFqO+wA=
X-Received: by 2002:a05:6102:3a11:b0:5f9:3a77:8b4f with SMTP id ada2fe7eead31-5ff324ceedcmr6793522137.21.1772471088090;
        Mon, 02 Mar 2026 09:04:48 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7afde2sm13865746137.1.2026.03.02.09.04.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:04:47 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so2885235241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 09:04:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9sNun3LuFUWuk1MFJTQtJZGgJ/XEut1niig7R9p6xlUi1RdKqPp8MYOYvjwAFr1i4vzsCxuJ4XghvD7kL3T9viQ==@vger.kernel.org
X-Received: by 2002:a05:6122:4b08:b0:566:3c58:efcb with SMTP id
 71dfb90a1353d-56aa09ebdcbmr6711798e0c.3.1772471086982; Mon, 02 Mar 2026
 09:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115164905.1203453-1-herve.codina@bootlin.com>
In-Reply-To: <20260115164905.1203453-1-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 18:04:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi+FsBveQ9HU+NT7iE7QOX0tKn4Jt_1mfDdq_D0=czJA@mail.gmail.com>
X-Gm-Features: AaiRm53vUk7M7B-wDMF-M0hLo3U5NA5Lw1tPHFA01U1qM9Sh00sGMKMEgNJmWxo
Message-ID: <CAMuHMdUi+FsBveQ9HU+NT7iE7QOX0tKn4Jt_1mfDdq_D0=czJA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: r9a06g032: Add support for CPU
 frequency scaling
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A3E561DDA59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-28668-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.219];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,mail.gmail.com:mid,linux-m68k.org:email,bootlin.com:email,0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Herv=C3=A9,

On Thu, 15 Jan 2026 at 17:49, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In RZ/N1 SoCs, CPUs are allowed to work at 125, 250 or 500 MHz when the
> 'ref' clock frequency value is set to 500 MHz which is the default 'ref'
> clock frequency value.
>
> Add support for CPU frequency scaling defining those 3 frequencies in
> the opp-table with the assumption that the 'ref' clock is set to its
> default value.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Thanks for your patch, which LGTM.

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi

> @@ -24,6 +57,7 @@ cpu@0 {
>                         compatible =3D "arm,cortex-a7";
>                         reg =3D <0>;
>                         clocks =3D <&sysctrl R9A06G032_CLK_A7MP>;
> +                       operating-points-v2 =3D <&cpu_opp_table>;
>                 };
>
>                 cpu@1 {

Unless I am missing something, the RZ/N1 clock driver does not support
the A7MP clock yet, so how can cpufreq work for you?

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

