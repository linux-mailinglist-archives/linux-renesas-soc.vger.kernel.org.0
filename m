Return-Path: <linux-renesas-soc+bounces-25224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369BC8BC08
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 21:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2EB3A61EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 20:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B820A33FE0D;
	Wed, 26 Nov 2025 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhEfGA74"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8EB3126B5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187368; cv=none; b=pLZE564T5W05WKMrJXFWHWQXEk61OWvmwquRPs8vMR2GAX0j5gRlTzKlFzNQoo/CSEg67Ekhe/QxXgW/csxPqVVgXxugLiZOoQSdbc70pQV9f90jWg3gXYN4sx9I8nsZLH55dl1XGW6+GgGGockHD0/HSN9VCOsTZZVfWt95F9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187368; c=relaxed/simple;
	bh=io2b3WP5mJSrzoPU9P3LKCt9DN2B8GXCdJ4X44P7TU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyW+WPYjrxoUQ/zSivgZiDNqOhgHKZohEtk/yb/+OWIIhalTI9NVyPVncqbhPU32anX8NxXCp8TSik+mUWRVENQS+UPG1rUIR0n7GSihF6fx48bMZDOk8h4dFHuSh3gf6nM84nACbotl/NdILeLNLfXA/8pknKPrvnUVXe6eHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhEfGA74; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so115401f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764187365; x=1764792165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io2b3WP5mJSrzoPU9P3LKCt9DN2B8GXCdJ4X44P7TU4=;
        b=AhEfGA74+WtLFdY7FUEVVqG/COqUjj68ANLx3nAvKOy3eGB6YdK2IR8pdSKXMx0UB/
         zto+FrF2N4GVjCURo5ZE3v++mNOCXPdqt08VuHNhEWisIHjlvMo79+eiX2R7H3pLFKKY
         ZtZ0v3Has5Hb1Ek31pYuB3E/0YH6evR2f9n1f6H/9WRyEh1lgulbfWwoTpe8zRRrncBr
         zsXFppqoke0qHuTdFdPQ/sMXa+OgqdiE9ad+1+tVp8BcmPgGqh1e5l/xp0bTScyDCWCJ
         0uZ3VFuqs4D3YtqnL4ldYgMnfxcp34k3sA0d8wMwfTIaI3Er9MI+jy8+Y7L+BaEbCJ6X
         exVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764187365; x=1764792165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=io2b3WP5mJSrzoPU9P3LKCt9DN2B8GXCdJ4X44P7TU4=;
        b=uhW7bggg6gnLoU7KY2hYpQsybsjUVNcrUleiO8iUa4ZhzxsWW2sbqbFp3wrLLH/V17
         obwAPzcnH7qafFsOylgXiT6NWJ/BndAtm19oKFmbYSrM1X/OwEnk5l53XHxZF/PUpq2F
         yzEi6J1aCBrtx50yq/7nW2AoC1BY0dWcfB/ZuKHY9Gs5gM2wTdWIlHqkpiMA2buPYT4w
         O1rHvRxJ4yU8dDn3MQOXWRYe79H64KymCZ+ALUwb5rdGS6R9OsCm1SwKsOkPCXIY9hUg
         m7JMZjKHMMJFdYfhJKKJjHZutcygBCmsfxpV3LJR32LNB0bORLFkl9HLXPWPm5yO6djo
         Mx7g==
X-Forwarded-Encrypted: i=1; AJvYcCUXPYaxVRainMfW6svPxAr4wUm2K776oKLy/YCK9SRAKwRx7ZZTan0JCW8ohAiDlMq6ObkkwLaMrB6X5mGsb66hcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNV8s/Io/i04mtl/vLLO1hp9i0NX2Arp26G5yIC/SiReD7Xd6
	RS3iHKA5PB59ZfOH4Ui6UnPltF6xEVE+nfFzcY6Rz6HQR3nLXYrrOo7vSYpM6plUmLH16+7bJQB
	LHk7u9Q/Xf/g+ZkjNYvcApmcl4C8TQAY=
X-Gm-Gg: ASbGncsvV1VR203cuwVZ7ipwLQGHBilVxsNX7Z8dQWsTjRLARBEzm04a2vCdfhAxQwi
	cothnofXe3BMMQuLrgP100/BtAsBkILw40izLzOUuBLICQIaKuQNN/8qoLVcoM+bODx3XB5fqe5
	Jx/Hhujwb1m0JPyO49YKr+A/1YI14A4o0EGltrkiwAj5K8Y+4mi94I6bbgR7jqJmvCRQnToMpUF
	WTK2Lzulp06zgoRPaemVCrVPEpKEhW5Yo/5nN0f1thxA77G/CYAkiEaQyVKJfA089pCz3l7U7Wz
	8QrmjL4kR2EyLefGQ9i0fqou0vLM
X-Google-Smtp-Source: AGHT+IHhPTLf5CTLCoQ18EsMIZtWnWzd5QhbLVXWFL+PMuHp5nvUjMTQ/DYhFP88GSmklCKy+nnqz6NENwZFNXmLY3I=
X-Received: by 2002:a05:6000:26cc:b0:427:9d7:86f9 with SMTP id
 ffacd0b85a97d-42cc1d19d6dmr21241880f8f.47.1764187364909; Wed, 26 Nov 2025
 12:02:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251121205546.6bqpo2bn5sp3uxxu@skbuf>
In-Reply-To: <20251121205546.6bqpo2bn5sp3uxxu@skbuf>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 20:02:17 +0000
X-Gm-Features: AWmQ_bmTU2niYWdcaSdZep0i6gskfGJjESBHVN_mhWxbtBqTU4OVzxNhhj_FZfk
Message-ID: <CA+V-a8vH+qCgNti+dHVXqfa02-zMnbUKw2gScWyeuh=EhL8HaA@mail.gmail.com>
Subject: Re: [PATCH net-next 08/11] net: dsa: rzn1-a5psw: Make DSA tag
 protocol configurable via OF data
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

Thank you for the review.

On Fri, Nov 21, 2025 at 8:55=E2=80=AFPM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> On Fri, Nov 21, 2025 at 11:35:34AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the RZN1 A5PSW driver to obtain the DSA tag protocol from
> > device-specific data instead of using a hard-coded value. Add a new
> > `tag_proto` field to `struct a5psw_of_data` and use it in
> > `a5psw_get_tag_protocol()` to return the appropriate protocol for
> > each SoC.
> >
> > This allows future SoCs such as RZ/T2H and RZ/N2H, which use the
> > DSA_TAG_PROTO_RZT2H_ETHSW tag format, to share the same driver
> > infrastructure without code duplication.
>
> Again the twitching when reading the commit title. I thought this has
> something to do with the "dsa-tag-protocol" property from
> Documentation/devicetree/bindings/net/dsa/dsa-port.yaml. The tagger *is*
> runtime-configurable if you implement the ds->ops->change_tag_protocol()
> API, and it's also possible to trigger that API function from OF
> properties. But this is not what the patch does, so it is confusing.
>
> I think it would be more natural to say "choose tagging protocol based
> on compatible string".
>
Ok, I will update the commit message in v2.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
>
> Anyway I'm not reviewing this commit until the reason why you added a
> new name for this tagger becomes completely clear.
As discussed in patch 2/11 the format fields vary, so this change is
needed to support the new SoC.

Cheers,
Prabhakar

