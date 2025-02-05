Return-Path: <linux-renesas-soc+bounces-12879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666AA2960C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 17:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 507021684FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 16:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AF619B586;
	Wed,  5 Feb 2025 16:18:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D671519BA;
	Wed,  5 Feb 2025 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772313; cv=none; b=XbhtXi8lBAdOsJ4pI2zWlOEom+aXsax55aBywwCoyYG5WWsfRu1+fT6nGdvGbkPdGjKXir7g+xHI2/k7qcK7Zt27u1gk92Oos+SsBWysTOaneDSYcJJaUeZrbeiKbUGYfQ2bDxX8CV+mf0yTnPX1+YLRL1ijV3keUJuZpkobSBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772313; c=relaxed/simple;
	bh=do9nDs7Y6ZZoJtk+uw6iDITZy9IqBixFjEGQxapufo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ql+EHZMIHw5Qk5WKH77cT45fVG7cvGqAGet2eD4/9bSVslv98G0Mi4SXbaDlSTN7nDwX7NhTN2kT0bZOGLRbdCt3uhrnVAXDIYrKm9T3s2l6iOiv4v6JuQ6KAPtEAv2w2TzaMaWUL7OTdg8OnNN9zkw+aN72QIH7vnP3NT15y4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51eb1a6954cso2031869e0c.0;
        Wed, 05 Feb 2025 08:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772308; x=1739377108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okBEhHymwqxe2MJMBMbLKiF36LLa783ElLRlo4KO7mA=;
        b=f8BMa+ngNfg9H0suoZzQmN0n10K2qm1m2PUyOpHKFkxoGY42kGZKwjZo8EIflUE8lQ
         DZveufVa3OLPWHZDHuYCPoswCUHKBuvYjGmrlJAHPWoVlJFUd55Nlc6BguVrtQYYKIaL
         hnIGAgUj/TYTp4eOZGWsbZEszRBlrQmfmrsHLPFXCgUy/zjrZeeh5xkqQS+XZk6gPyV7
         fuoSyBgbefwyno7D2lrF/LPZ8mEXPtUkC6fjyEMtUKRc0yjgtwwGQ9FCdBVbcWg5WiW8
         cayP1ZeW0vgaPnt33ymV3icHG9MyxaWYprpn6r0VeZjL6AZM9tIVrKvMK5bBh9LGtuNg
         cCjg==
X-Forwarded-Encrypted: i=1; AJvYcCUdUIJercHaIe5N4P5x5i9sCvRs2LUAtqcAzPPbuUfVHpeiW7RXA8uTjxy7BZTD9GcaVj5AGu+d@vger.kernel.org, AJvYcCUxP5eq5hCiLUUIQ3h9VRm5WXCVQyjGCI2LEa4iEIfHPLZA851gNcaGhZQtDnbpni2HPF/wu2yG9DzjD+3NH7Q4Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhIQZjKUGteROiQTEHTp3fM/Ku+JuuBxefTYf1i9ESXwKwz8e
	TOIXdC1AfC+m9QMZfoq5tfuHC4NC8926lcEJtbMiXiFMYQFN4sa8GWhiaDmz
X-Gm-Gg: ASbGncvMEHYQEyOJgjLebVbXcIfxREEJETYSuO9k6UGMvA2C2hxlqu7JV7JGnrE9wrT
	4miaeHIDvRjfiqNY/BAGo2HNemyd4Msrv9UQ7qh04cx2LAb12wS71vRxaygFv1c+mNgqDnhra13
	Yv3JUTy9/cmetb8k9xp0pDM/5h58ckpd2sfZgcWAhHBWzEA/wKTqB82OHYG75mbi97mCJnl7Eu9
	TDJ9v1JUA+GxKZbFdZk8JWbFGgWhIr/+zczg5qOSBMUmORhZ/H+CDRWeiS8FMQ+MS5GXxG9C11u
	OQW6Sm5x6m2VWcJ4T8syQnWFkoGHEDH92DSZB88VaFSUD7AD3TH1BQ==
X-Google-Smtp-Source: AGHT+IH2wLtdAAV4sjC7ysBKTvnWhGsfA0xS3eoENY5lPFnUbkFvgcxjdqOEjYMok5+ygtHO0+pxjg==
X-Received: by 2002:a05:6122:3c45:b0:518:a261:adca with SMTP id 71dfb90a1353d-51f0c4edb8dmr2369535e0c.8.1738772307692;
        Wed, 05 Feb 2025 08:18:27 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d62eedsm1893038e0c.33.2025.02.05.08.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:18:27 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4affab62589so2142831137.1;
        Wed, 05 Feb 2025 08:18:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOd7SpUwmOLYql3ORwAoRP6mGIq8EMWHGl0xzsQH0TiKW7mohCyXvS3qncGxtDsr/kgQIcEZUN@vger.kernel.org, AJvYcCXHfwTLAi7OcZTS5sAsE8mkjUy+j/eSg0wgtGPq/Esus7y0vxQIgrxs3olLrLV4q2rp6Iim6RWT6xcIodxmoovw8w==@vger.kernel.org
X-Received: by 2002:a05:6102:3f4c:b0:4b2:af6e:5fef with SMTP id
 ada2fe7eead31-4ba4789000emr2672907137.9.1738772306447; Wed, 05 Feb 2025
 08:18:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be>
 <6d09e337-8bca-4ef7-bbfc-d824829ad211@cogentembedded.com>
In-Reply-To: <6d09e337-8bca-4ef7-bbfc-d824829ad211@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 17:18:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgydc4q-dSsUQ_zLpkvbv9-26T3tpEO6e7OF491jTrEQ@mail.gmail.com>
X-Gm-Features: AWEUYZmzpnEhwLTGdJ8zRUmRM-du4YJO4JlLP70uOxzgO_SaV1jqPfTnzMYclmw
Message-ID: <CAMuHMdUgydc4q-dSsUQ_zLpkvbv9-26T3tpEO6e7OF491jTrEQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: renesas: rswitch: Convert to for_each_available_child_of_node()
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nikita,

On Wed, 5 Feb 2025 at 17:15, Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> > Simplify rswitch_get_port_node() by using the
> > for_each_available_child_of_node() helper instead of manually ignoring
> > unavailable child nodes, and leaking a reference.
>
> FYI, I have a patch in my queue that replaces this code with traversing child nodes (via
> for_each_available_child_of_node()) and only creating devices for ports actually defined in the device tree.

OK, thanks for letting me know!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

