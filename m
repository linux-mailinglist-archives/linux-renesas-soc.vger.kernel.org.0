Return-Path: <linux-renesas-soc+bounces-33063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJa3AiT+E2quIQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 09:45:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6706F5C73C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 09:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F131F300C910
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 07:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF153D410E;
	Mon, 25 May 2026 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbBBaLPA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C73CF67D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695115; cv=pass; b=tOZU95i+vmWdcPSPVnJXQVED4jpLwDZNya4pCDG7uS5WzikVgyrx8kAewxALgLXraHguRvwqI2gTbkNo1X5e//NYITMV/kIWK3+Cew2uXNJ1Qc+ZNyWeNT5DjtPHELhBLsQ0lDHkZTsh5AG1K4atf26U5mLpfchVuBXcHC1Wc3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695115; c=relaxed/simple;
	bh=nqsZdMf/BBR6bmZa7PHlqIirSjOFDpDYL5VK3Qr4DD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyfv7UcgSyYwjNPL+yT7mR2gf92kbtGgHPpnyMfh+fWGXsMmegeJ/iCnoz0Rsv16VtmXaWSxc8maHyIEf9oAqsoBTJjPtWjv02Od6+a/kcBn6h2U/1RTpVh4RHKpL9QQO2e5Oq6lTOjtUa2WC7Yb8sodE1UJI5Nd9pEqQcTiTlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbBBaLPA; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso10549839a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 00:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779695112; cv=none;
        d=google.com; s=arc-20240605;
        b=SB2urVecfGO0SuvZTlVR1YiDgdtdIUiL+k7/UK4oybxmlc2Ov42pZnt5I5svi8AWvd
         +vn7vcXO60apoefQdofnKNeISsheXdTc3hH1oGG5z4qwyc7hKAUyYmYRR6Sy9++j6ZYU
         0rTFowe12nEnzqzqLtqJ4hjycK8QcR0Ja9Ba8o3JPx6qhTshNBljK7WNUqnU7hGPxXcK
         d3OeQxd6qyIbqTEhOdvh/cNf8ZkKk9qxprEt/ugG4nE+rtBXWwmoc7WgEig/1uDYoSeO
         UOmwoX1uDacbVZxn8ILhqyzylnem4CbikoAJzGs85V78ky7CLZuSqUUWim6UYrSGVk7k
         RE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        fh=t3pwWnFZ3isCitiQhB45clULoGyZ1AhlpDI17j0F0Uo=;
        b=HzSnHNU25C6fEuoKHllvcl4fwmUUDgUGngnew4EdRPKV2g9Unskdxs6YPYtJEXsQLh
         zlhZXeuZkRkUcB+1sBGrusHdCFHKxMyQ66VEli2F4cpOXTo0Jif4jhW2Uj2K/00MqZGU
         70CPYyf6j9QunNoKfNR9rIhI7+UF3qz76o2nXjqpi1Y4pLme4NX6VsT9J6/6sNxTF/Ui
         L3HbR8K+0oxMjuB0RfYDgvJ5gJCxnqaQhwh9eB6os/jKTbI5nAkKR1r2pxoGdqjv3B+f
         M7DNYcgSrn9L/ee2Z/ukt52dZGUH/oM3HcIHPzPugj4V//JupxxNR+HtfUdjO7D+NuXT
         9N2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779695112; x=1780299912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        b=VbBBaLPAHxqCacTP1YSBEer3oKVRZkdClyqxUjON0HgD02C+7CJDfduCj4scKlkSNZ
         lkW0RWhhsS3InNV2oPRafQt5KeF88lBq0vCFjoEh6blhMd/wiUa9XKRNfsPI8jAgctkL
         vZBNH3wpO0icAgKAZoY3uhPSwe2JVkTkmv7lbkK94soxzbrq1RAcNQWJpO6yXbKbAleG
         dUQLoGw9cYu4ZM+FnUdWOFEDbJHAunuF6EQyuBJ03j/a62Iynlp7e/b/4rJgUh1Svbzv
         xsfa1U0fq8c0E3r36mor9U0bHfufy9Dpf2ul4RcYD8qSDvMxtqLhBNxx0f5ZcKKgHfGb
         mLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695112; x=1780299912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        b=kRgn3jDzISI0awLBzTTO5d5u52QpcuFyZr6hebpzTnKU8mVWAJFKWD0EGmoDlqfM4R
         O8rZwAI+zmvHqqRwHW6T7zkMZtpPYsqaQf3GL67gzxscTTyJDdQdiLG898Negp72AmnM
         o8tIx/vei4k13xB9zyvJ6Rn0TpKQ/Hsr298um1raaAe/wrhq90UCrSYIQ3cG0TThkWJf
         sO1IafLJvwKHsk8DIZQDUkQhT+yT310/m0nIMgHX72OryOXzOvZDgWYCVJnc1THq8JOi
         OHSp/c1AfHGZK1APVb/fHAf2q9YaDYb3G0tdIcyEqcHspVYRzXWQ4+6LgEzT4C95rRvG
         L0Mg==
X-Forwarded-Encrypted: i=1; AFNElJ8r3V2LdmgcVdJBAZl3yI5IrAnK50VYvVNWusFTEy5OaQq4H3SZNYAyg+9SPOxH+rY2mKAY8M04i1a+JMzKwE4y6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+A5trsPka5+5MQVRdyguOrP7S9P3/dgytjgC7buDZrkgg7b2o
	/bTVpZrVyc1FhdZb1mi2251Gj8PhUK8X/oXUar+ZYp59eDgBEpbldIxlqXWUhwgioEFZvMWR7ca
	sh1WQEdOxk+sIUEfh9Ml5h57yMg2HBDk=
X-Gm-Gg: Acq92OHjDZKTg+YIIEYQq7CdezGDxRW+ldPMGKgHUKt+n36xKCNo6gcsFrKAHNOucfa
	fhqE/Xn9nh00ivrgsa6jO483LX9+sWa0GBcM0HE/5VageJBMn5y6j7TD9GNFZQIZTBcKAnUiwi7
	IPQhywW8Jc3KyYa8jn6P8w3z6WNvROZ2L9KoNn1n6JyW8ydoyKdsmnpr/08cTxXG/YB7VI6T6uQ
	4CEsZo7TJg59ezDStmveoQXit7ox0TUvhzGEn4YzZ23qAPVxATbTXU/rCHHuNuPOUCeYZ9g/9aE
	kQiwfVsbYw==
X-Received: by 2002:a17:907:271b:b0:bd8:26e5:d79b with SMTP id
 a640c23a62f3a-bdd2aee6e70mr587552666b.43.1779695111967; Mon, 25 May 2026
 00:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524194457.479681-2-biju.das.jz@bp.renesas.com> <20260524195829.960401F000E9@smtp.kernel.org>
In-Reply-To: <20260524195829.960401F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 25 May 2026 08:45:00 +0100
X-Gm-Features: AVHnY4L2cxrewHdjoi6U0d3gX5aaO0YVqb1OMYH4rfrIl1qNl3L7Ph_c-s2fQ24
Message-ID: <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33063-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,108a0000:email]
X-Rspamd-Queue-Id: 6706F5C73C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bot,

On Sun, May 24, 2026 at 8:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] The compatible string 'renesas,r9a08g046-lvds-cmn' is used in the=
 dt-binding example but is not documented.
> - [Low] The parent node 'lvds-cmn' in the example lacks a 'ranges' proper=
ty, breaking address translation for its child nodes.
> --
>
> commit be595c0db2d85d9ea1396f0f30ac7ad75f4101fe
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
>
> Documents the LVDS encoder IP found on the RZ/G3L SoC. It supports
> single-link mode and shares a peripheral clock and reset signal with the
> MIPI-DSI interface.
>
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r=
9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renes=
as,r9a08g046-lvds.yaml
> > new file mode 100644
> > index 0000000000000..b1f6d020ae7b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g04=
6-lvds.yaml
>
> [ ... ]
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
> > +
> > +    lvds-cmn@108a0000 {
> > +        compatible =3D "renesas,r9a08g046-lvds-cmn",
> > +                     "simple-mfd", "syscon";
>
> [Severity: Low]
> Is this compatible string documented somewhere else? It looks like
> renesas,r9a08g046-lvds-cmn isn't present in the tree, which might cause
> dt_binding_check to fail when it validates the example.

This compatible is documented and is in next [1].

Q1) Can you please reun the AI review with [1] ?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20260522&id=3D51284d8b1dbcd7fa0220c49eeab29b14617e0d88

>
> > +        reg =3D <0x108a0000 0x10000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
>
> [Severity: Low]
> Does this parent node need a ranges property? Without it, address transla=
tion
> for the child node's reg =3D <0x10 0x8> might fail, and dtc often warns a=
bout
> missing ranges in simple-mfd nodes with children.

I don't get any error or dtc warnings. Have you ran dt-binding check
before providing
such comment?

Cheers,
Biju

