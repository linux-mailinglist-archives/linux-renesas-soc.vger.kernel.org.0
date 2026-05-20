Return-Path: <linux-renesas-soc+bounces-32859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOTmFE2IDWpdygUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:09:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE858B626
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E56EB3021EA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11EF3B6BFE;
	Wed, 20 May 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HO1r8w8B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C036CE03
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271526; cv=pass; b=Ne3fDzio8NTcHUGYsOdaZ0GJRhrP1i0qCRFLV+Jq4A5hYqg3CfX3J/AdzyIbt+4v/U4xbaOGgUkH6tPwfmfAfxs4B7ysjZfCanwBco7c4gnV6Iyq95n97afFxtb2uTbHIk1x15KAUj3g0XCfyx7QudOOp5KkRUyWQ8z66EXTX+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271526; c=relaxed/simple;
	bh=u/6205l7iMnwqWVLXGAxcCKZD8Sogf90abuPnY6+8YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccoQYIiQuVSC99uxoxTvcWYiPiw3TRQ4NmxDc0NSm1S88dazNlc0tcXTul5Au99hitbQSP0QwNRSmyDo9/UO4RglsDrvmzjF6Rk3qX7pFT3UwS+5INVvmUAbCrbRfLX7GERAXs5wpaLo2iFGHqLI7lBwfmWZNn5n+awjJ/llsns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HO1r8w8B; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-448528f4e69so3160709f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 03:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779271523; cv=none;
        d=google.com; s=arc-20240605;
        b=REs+3LS0ng6JkQGtnl4YFT+lNZJo++RhqSlPQEB3nGkdAT77bWIz7Y8YuX7RGbWIL4
         IKneZwehY5hv2vNqxAa/iYyUB7RjClqwVdAtnVmGehgLFRSWjZlA3gqDJeovczEiwYNs
         9QlmTc/95W1kW5QdE90bYJUxrg7mQg0FRUCslvOZlMFCp4ZYxLnqckkBuxj54pPtmafu
         FAKdwt6hPxhwD9+UyF7Vc5oZDIIYjlXlZtNyyvNwohSnwYIQPyXdFzerF3FYbicKnUfA
         GEX23zVyVMhw5fNCKMeTPf7TIESyucORZ4lY9v5krIIZvs7rTsZ+XmdIncxIMtTv9G+6
         qkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z1h1gbTy8T7fcLJb/vcSzl6o5vQ4FVeUEqyDq65RDD8=;
        fh=hhXzddyGex40TLWUCb/v+FShwQeDzhFWApu76UFhD5o=;
        b=I0LLzh4tImyHL51afI0AFslvksABmwj8I1v8KY1SdP8fiWFBvrsaWfoCGVQsLCHFxV
         dwzUkvyPeFZZu7Hmt5CXfzciRC/F+JU8qr4+CGn898cX0emLsaA92ZXhbdrBv3OL7mEH
         dRV1Ni9Mb2mKaDuWeYRAxRlIw1PvlkLcg7K9ZWRcXVSLCWlTX/g/KNUPQG5/kV1XwZ35
         rBp29hBfLdaKTnrzUtj2mjPtfVba+iNtHHRBT55GWnVl4bmqvx84+/cOZ1ZbO5JIG3Zp
         mecXyHYQPU1qBsM7urcjG4moQ2Jpxo90ox6W5Q7N0z+6pia8cKj1X8T+ejRzZOGAEmTk
         641w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779271523; x=1779876323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1h1gbTy8T7fcLJb/vcSzl6o5vQ4FVeUEqyDq65RDD8=;
        b=HO1r8w8BouR0pEnM/AJYEuOy+kxkGPqRTSscTp93DfdU/ez6x3NI+r3Q1xEjLzr6F1
         igDWX+OjgWmiw6slzHkliD7wXGFwt9h6GiEc2mmro7Q4/WvPk2GBfYIJVY8RXYmWXLDE
         TKQHFM3cjcHvXx07Tt/lj62bFApCqMwTOBGWrVe59b20HMWcJX5vfcW0leiLaXKRdU6T
         ZkAQvwzT2KGZ71MGE9mph9fgKLZssS+9+UPs5WeIcReYsdnx7la1ZeU1UjTnNuIFXdOU
         /VXMgaRZsiMzwaWnkFNOSdWumfEgyM6Ji150WBwpg7D5OjqGyODAv2X994Jw6QeEERqW
         ulZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271523; x=1779876323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z1h1gbTy8T7fcLJb/vcSzl6o5vQ4FVeUEqyDq65RDD8=;
        b=d7bQV89GnuCgso34DMalbsOCjCdJL/vgc5WwbBiceJAhD1kcCcR+DHsWHh/Xi+0w6B
         C7fowB9XwYtbSD4b4aazlf6E9nSSFt/goWm8ZjyfO5vt+6bDFnpRFTuFSS4xL1Vwcdd1
         TVeVuHGTdk+unWtGvDczgTBbxwIgrAqwIr56SIhtjQ96H3W+esqrzgZVl7AgbN1TpyW3
         USsZLeI1tC242tsS1g3X1+Pm1FQFvEGhyTvyXdcGVXuQ7Q5h7K1u6amVKb2bTJz7sMEA
         8Q1fJGSaQFJVs5GsbYKmfss20osoDCIr1mJGUVqNk7ycOduBR4ccZpg4lmBgJ+VydBu2
         SumQ==
X-Forwarded-Encrypted: i=1; AFNElJ+35gcutOiZoLN09WgcFY9pZ2+MtfuDwxY8XzWFS64nbdNXEC+6O9VeZ0oHyFBiazkh7euCEd7jvKsQFMHaarZ3fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdrzasHb9ty/bF0l/tB0lzFmdxvkAMh50/90slMJ3sT4pIjMQx
	13AUFxGiNRaOUPzKYHxUOTuBuzemZ3UWVtKVOuTMl17jjyJtNmCBImWCQiInC1lFQy7xCZ4Q/W/
	t+R3MpPinCACB0fm4hiwb21ZEHj7BIeM=
X-Gm-Gg: Acq92OFDTh9NFap94ll8kqBQEFu5OyUEiI+Ta+08P51Z394mGt3KaiYs6hK5Slx3XsF
	Byhc9Uhzk88kYgAbidI/Uel4Cx6V80whaMuKa3ONUe8RYLmpPvco30qg3vbEkA4dpXQwuJnpTWv
	ivj3BeuhGidLEM5ZA8waCJSl1T6A/A9rFJVpetPZoOYU9ugJxtSOsahx+yvL9zFnT0PMaRaP8NZ
	s4a4E3uCUBLhf0iPZn74WV0UQlaIVtjC4OocIlMEUrQtv4SXmtW0fi7RT7Mzu5SXEeRQuQOugY4
	PI7zuKN7uhZmullP5CsG36JtBLCik82EhBi9t7BHbNz2qW0ij8VWvATjJ6A4W0MnYWaUGfNFLs9
	45vYK
X-Received: by 2002:a5d:64c6:0:b0:43b:4136:1e6f with SMTP id
 ffacd0b85a97d-45e5c5dadbamr36893897f8f.38.1779271523324; Wed, 20 May 2026
 03:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520091111.67666-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUpa_R0C70eJjS6urpSx3jtcVnbjZ8K0OvhO25Bx1-u4g@mail.gmail.com>
In-Reply-To: <CAMuHMdUpa_R0C70eJjS6urpSx3jtcVnbjZ8K0OvhO25Bx1-u4g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 May 2026 11:04:57 +0100
X-Gm-Features: AVHnY4IgebT0d-w8ha5uMUJJ5b2Bm3VcKLOPFArk4myqceaa3cNrfoIoJYMWWEU
Message-ID: <CA+V-a8t1osQxWOn2Veyjmy2kquKn7XvTbX9h7uGXtTje4N2Jmw@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-host: Remove unused LIST_HEAD(res)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32859-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[mailbox.org,renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: ADDE858B626
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Wed, May 20, 2026 at 10:20=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 20 May 2026 at 11:11, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Remove the unused LIST_HEAD(res) declaration from
> > rcar_pcie_hw_enable().
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pci/controller/pcie-rcar-host.c
> > +++ b/drivers/pci/controller/pcie-rcar-host.c
> > @@ -346,7 +346,6 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_ho=
st *host)
> >         struct rcar_pcie *pcie =3D &host->pcie;
> >         struct pci_host_bridge *bridge =3D pci_host_bridge_from_priv(ho=
st);
> >         struct resource_entry *win;
> > -       LIST_HEAD(res);
> >         int i =3D 0;
> >
> >         /* Try setting 5 GT/s link speed */
>
> Indeed, this was never used since its introduction in commit
> ce351636c67f75a9 ("PCI: rcar: Add suspend/resume").
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Since this does not seem to cause a warning, even with W=3D2 (TBH,
> I had expected some shadowing warning), no Fixes-tag is needed?
>
It does actually,
drivers/pci/controller/pcie-rcar-host.c: In function =E2=80=98rcar_pcie_hw_=
enable=E2=80=99:
drivers/pci/controller/pcie-rcar-host.c:357:34: warning: declaration
of =E2=80=98res=E2=80=99 shadows a previous local [-Wshadow]
  357 |                 struct resource *res =3D win->res;

So, I'll respin it with the fixes tag added.

Cheers,
Prabhakar

