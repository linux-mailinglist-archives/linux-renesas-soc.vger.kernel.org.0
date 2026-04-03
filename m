Return-Path: <linux-renesas-soc+bounces-30827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJRADZuDz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:08:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A639298F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C163307BC3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD233890E2;
	Fri,  3 Apr 2026 09:03:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52723E320
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207004; cv=none; b=J98na4MxT2FhCAa+Feb6fVBrH00oDSCKX2hcBdckadO2UZ4PCmkgnyMaN7nz+6Omi4m6qUT7u8lgo06W7FkmRL0cPtZN+ChHI+f9BPSsU4UUVO+oMrKeq8UbK7Zf8HE1FbUl0khpQdMZwgtX4MHJO2mdwa5X3r+OS4+IWJMxDbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207004; c=relaxed/simple;
	bh=JEJTNt6yJrQY8C1EF2vPzaNXrIXOVaxrHd5bFcJyLeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Af/WlG3AmpYDHM3seQOXe7r60uvxoDPgH7Vg1f0inG8D7qQfyZGd+SKMzJiqekYsb6a4ssCGLNSkfteh75VNOxogMZ4MSuwCcOeSeTrMiFNoqpLgzZnLbZ/GYQ1sUeJlBOkbCiDx0cKLpj/rzZvM/0S2lMaCIZhok/wpYkt3wz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so467076241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207003; x=1775811803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrMS3BmPgb8kmzZIH9W4BGKhy4JgCpGMmlju1jJRqIE=;
        b=VdkNkEJaUIs87eCYQyZ3X+0i6xdRQNZFlMb6F551nVYMPyx2L7A58Eigad8qc5/SmS
         oR3rX7BiyfkT4BIm0TvVEnIwC4X6zBhTqmafek8ktMqAFRrs31rfgmcR/sKX10e1XpGq
         aS3bZbemndSbYxUqEP9f3ylZ2oQ2LFQwiib6Rvn0+SSLavk3nWqtcWT4bCtqW3avIdRy
         l2v7FZMrS6gi/DpPu5cIXQwE6lhSqJRDeRTlTQpjVqIYuZSDEIDTeLjw+Zrnos5/EfEh
         PLKfsdhKzL4AaOi9zByuQNh1NxwDJjmcdMKgQDwYxfR2PRsNh2lEcJ9AFJM74oTc693n
         ShMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzCKM2nJ2O6zRExO/NhcEvYn/H6VLTNUn1MWibIAmnlCQSuZls8KwPl6s/mcDTpZ3jxieP/cI8PB+OEkjr+J9hIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3zwQZAmDXlapSfUuKZ8MrgH1y9GkxDLs8z7b6f9x/GSsFUjjv
	sR4xd3TarZQYPt9riohJJi04Q0cQDkmHRMBT8d/nOwyoYN4Avikwct+2EJdAWPOk
X-Gm-Gg: AeBDiet9S5oOO+7MGa2AU80oC/rA5+4guHiZMnuKKpDqB1ulQ/R60my7EE+3oy3zigm
	pbu0Zs3Fs5ITb60H64Nwykrty3etrJj3ye1Svg5JoMl0zVHw9XoI4GHDyIOhvziYY/ivn1Lhl9i
	5lqVEb1UObZItVZZ/Vhoz2+voGelHXoAcVrdc4ytXbyKOMyI1Qe3aNxmSR+f14tviT3glEGP3P5
	rC8U2Qbg5fY0iMnCHbyeuvlssh7hdYgnwtDsn/Bf0Y6zRb4bjsgfyLfTwWU2O9rkK4VGplXdEqf
	79i6MByJzv9QRgjwwzovVxNpTmj3UD+a+IxhK0fX80bgexcXNt27pD1Ss1/psj5HNXx0YYqTZC2
	GCpshu4iSwSbsPRZyXV5Wh0tnJzXxuNy9sbjXF+i/8HYHjv0iqFQPlbFcZTeVDhrFkp8LLImqZ0
	4kYymjNuTKGHlrL7MKjIA99NcTNuA4M49uHlzxn23XVkkHT9TI4IeRfRKLBYJuVCLl
X-Received: by 2002:a05:6102:f87:b0:605:56fe:8c47 with SMTP id ada2fe7eead31-605a4897360mr771412137.0.1775207002719;
        Fri, 03 Apr 2026 02:03:22 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm6754843137.2.2026.04.03.02.03.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:22 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56adf76631cso664203e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuGH+omBydPwIn/3nsjfsL76atXbQb8EXCtPY81hRhDd/GrFZ9rfEZV4k81mubPX63i+QgcG2WkwYYzWVqJegdFA==@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:56d:3c26:20a8 with SMTP id
 71dfb90a1353d-56dab8146e9mr655900e0c.3.1775207001558; Fri, 03 Apr 2026
 02:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJsrB6vTHafKnpGDqb-Lc461T9Hd-nWPOVdm7E0MukDw@mail.gmail.com>
X-Gm-Features: AQROBzAUWGgjsdDp3P5htV2JBQzE4EKlybGyOmFyU2VyK7rwylLSVOUsW4xN9NQ
Message-ID: <CAMuHMdVJsrB6vTHafKnpGDqb-Lc461T9Hd-nWPOVdm7E0MukDw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into CSI2 subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30827-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.823];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,0.0.0.0:email,glider.be:email,linux-m68k.org:email,mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email]
X-Rspamd-Queue-Id: 8B4A639298F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into CSI2 subnode to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi:49.10-55.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

