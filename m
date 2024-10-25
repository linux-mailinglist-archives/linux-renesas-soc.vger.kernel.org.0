Return-Path: <linux-renesas-soc+bounces-10163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 307509B0F75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 21:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5349283F0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 19:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EBC20F3E5;
	Fri, 25 Oct 2024 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npvWH9d8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F63118F2C3;
	Fri, 25 Oct 2024 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729886340; cv=none; b=fnh+xnlXgUTLWXKcwai52UytJXVifoGjE8i9gc3OiQktK+0RhO/iG0dCoLMroDM7IW2GX/GSz/8Y/6E1oucuTTxsG042+1STi6MYLaTbhOCN4G9qlStYC7zSLHDAviqp8ajlKYuOuhkWsauFQIlMyeGOsfLcfTcbO+qKKmkm1w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729886340; c=relaxed/simple;
	bh=zFC++jBmMZ06bu192xM8P2lCfleL8XiVVwImFJLb6Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yp+q3cffwhE4xaLrQZPlOGJmE1zukp1bdlyLdBb3eY6VtI76luNZQnuhhz1jq2i3+/a5gC20P+lFa6BuRZPvA4u8EE4HQAQ/iATkEqcxWpkBxLRT1/hqkiSUrW1q7FevQKs2Sgy9075DrqPQqDqDs2dpO3AnnSe/E5oSUaO0Ndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npvWH9d8; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e38fc62b9fso22990447b3.2;
        Fri, 25 Oct 2024 12:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729886336; x=1730491136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c62agzyrisdk2oPUn8WefxMnvRtz6JumhxuKX91JfXM=;
        b=npvWH9d8H4f69t/pm1vJzJMcNTCCu6GaKC6rUyflzqCp7j3YDp2AOA8bu49jcdoOJu
         LNHisMCvdIKPrt902H66YZT0IDFudu+erX00JyecIv5O9gOU8vx3eOQlBFHPlgh8NTVX
         BAQaXnGUK0uj/KGPL8tTLIJG+QPJTdrJqMv1yW1BLUPp/PUc1sP7jj6COLdMXNSReSDe
         Ak/KBkV79yMUuw6+lpBX5JALgNZV+QaUSw4OnKMSNDmq0i6TOQCp2WJIYtj5HxOz9OCM
         Wnj3OZCbdYKznGFf3xCC6tn7oinbjn+XRI1/m5S9yjRLke2pYI/pmb9g26wj2WKyU+SO
         MdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729886336; x=1730491136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c62agzyrisdk2oPUn8WefxMnvRtz6JumhxuKX91JfXM=;
        b=KhVcHIRTp89h3SUN9dHXqgNEQoF0Xucu8J+soFs+cDeURc/zugJ+jkQkGsIEW9yX5J
         xE68EZ/ha8qtZJA4fabE+6OyIDn/yY7pWMkmFYmy071b6BPJcLWY7CSfuIPH/iAs9Ha0
         EUStUPOlx9E/nm0Fkjnn5Q8iIlPy+hBbeWNnleXvREonJJ78JLe1BVo+AQU4R4ECewAs
         n+GJAJ/q7ebOJPZZd49A7OPQWwiv04IDQBRwQhel6+Pb78RxKnDWLnCYCbxxCzPXixgz
         B+pZzpuMNoTpFdH2wY1HRWhK/X96pFTYvD2UKomK7pZwFVR94tG6/7A8CwexLpnbolDX
         IGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU395jluYT3LVF9bnzBdlQDgFxY/yjFY2uXMpcU5fTwwIDVRR8uq7cVF0p2hZTvaOb34U80ziBE4iYJk0g=@vger.kernel.org, AJvYcCWV7E82SLKt8BbdgtWqgcQxj3tMkTkgFvM1+0aQpHYE/CdRnhek4PjKzTw5V9Zto3Wcm5sxjNzWPH0FHAAe7BdKeNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEP6KtH7CNZLBDuk4KmgEAfnYhd11C3GQ4tsytcdznGKF5WFqf
	pw0FM2w9y+c36lzi30VZ6lH2ny0DwcWuTeoelCMfrkEIEfiK/aG4EqLYNARG5ICFgdllSPAXgNk
	CQW/AnDXIptAwtC7K2ckaQsk6fag=
X-Google-Smtp-Source: AGHT+IGeIh3d6QxMVq5wb0rj7elWgdVYRslpRVAIRVCq54ziyiLu4O1jYsgIDgXr2K0sVCbFDRLKYiek10lk8xvY25A=
X-Received: by 2002:a05:690c:2a43:b0:6e3:39ed:f029 with SMTP id
 00721157ae682-6e9d8b542damr7521497b3.44.1729886336543; Fri, 25 Oct 2024
 12:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024195238.176131-1-rosenp@gmail.com> <20241025091547.GJ1202098@kernel.org>
In-Reply-To: <20241025091547.GJ1202098@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 25 Oct 2024 12:58:45 -0700
Message-ID: <CAKxU2N8A2voX+VddMFmUZRzGHA5XZExWTeF4qTbVdt+baN_NCw@mail.gmail.com>
Subject: Re: [PATCHv3 net-next] net: dsa: use ethtool string helpers
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>, 
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	George McCollister <george.mccollister@gmail.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 2:15=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Thu, Oct 24, 2024 at 12:52:38PM -0700, Rosen Penev wrote:
> > These are the preferred way to copy ethtool strings.
> >
> > Avoids incrementing pointers all over the place.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
> > ---
> >  v3: remove curly braces from ksz_common.c
> >  v2: remove curly braces from rzn1_a5psw.c
>
> ...
>
> > diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> > index 9201f07839ad..2bb1832d21bc 100644
> > --- a/drivers/net/dsa/bcm_sf2.c
> > +++ b/drivers/net/dsa/bcm_sf2.c
> > @@ -1180,11 +1180,8 @@ static const struct b53_io_ops bcm_sf2_io_ops =
=3D {
> >  static void bcm_sf2_sw_get_strings(struct dsa_switch *ds, int port,
> >                                  u32 stringset, uint8_t *data)
> >  {
> > -     int cnt =3D b53_get_sset_count(ds, port, stringset);
> > -
> >       b53_get_strings(ds, port, stringset, data);
>
> Do you need to update b53_get_strings() so that you pass &data
> rather than data? Otherwise, doesn't the call to bcm_sf2_cfp_get_strings(=
)
> overwrite what has been written by bcm_sf2_cfp_get_strings() ?
good point. I can't change b53_get_strings as that's being passed to
.get_strings() which wants a single pointer.
I added back some pointer math for this reason.
>
> > -     bcm_sf2_cfp_get_strings(ds, port, stringset,
> > -                             data + cnt * ETH_GSTRING_LEN);
> > +     bcm_sf2_cfp_get_strings(ds, port, stringset, data);
> >  }
> >
>
> ...

