Return-Path: <linux-renesas-soc+bounces-19726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632AB148F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 09:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31CC31706D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 07:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D56225CC62;
	Tue, 29 Jul 2025 07:12:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00FD36124;
	Tue, 29 Jul 2025 07:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753773121; cv=none; b=sQmbeJNpyhImqtm2TxBg3KyoLKgrrdS1JE2BfFwXJPP0WDYeJtc5KDvgyh5TBgdy8bPaNslUEJt5cVQ9rRyesXS4l4x4iVOL5Ecwa0mzw/9kWWFsWlYzH3a1xGaB1PteTmgRLgT6IAR545plKul5eDFCIqff/K/QcTnkwjaTqog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753773121; c=relaxed/simple;
	bh=XiaUxDcQsjkqrm62MA9BpXABVe05uEqGTNkD8cUJlKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/7g3iuniAQxTGHW+XyueSNnvthka/HpweqTFMZ5hy3udQQUkQB2iXtInIJGWLe9XTRyN1LoaNizYZ1limYITE4F21CX/r3iJRlsqJnw+QKpJfSft38FbXQMktffas0IPQRLQhvjAcPcMVpRCtRZ+v1tG+BDxSeyFlabiVMxwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7eefcbf08so1646638137.2;
        Tue, 29 Jul 2025 00:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753773118; x=1754377918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwtZ91dpf+B7MEEcMgVcJwBLL73NG/P9b1e65DE6H/4=;
        b=LqtuPQ/qMWKdchpFyxg6dV7LKzhLP+6xss8g2nU7LewBSQuBEBbkf4+ESkmai23Dwe
         oejjcxZgf6Ia8JGYy9jZAL87Ngkraai/XVACdK8VdwWeXUUF2V9uGcBlmF8HucQRU2EF
         6T/qZH462k+nglKoNtNV0JkLIenli1QoW91YlUsoCU11+SL4B5Jhauq3M843zu0446qZ
         glOksNUkVeJdWDw6nTaeRJi0TYlc7vuUNoHPnqdaVUllVDBjtlpw/b0nEAV15PXraAue
         omnFPmTqFGx0sk+S4s9bp66K4nZRuPvWa98SVqpSwF1BOePoEX9Cny0Tmua290KsEbMq
         K65g==
X-Forwarded-Encrypted: i=1; AJvYcCUrEcWgc7hpO37bS8zVCdfE6+rqxI0qUWlyvcPD/m0o7M2w5Sfg0nndv52gmjNHe6LjgSqCPwWI@vger.kernel.org, AJvYcCWLaqV1Yxgf70E1aHx9OY+PSwNDvcOoAztY0bCC80OkmFZh+JUrAqgMV3d474wnyhaB14mSrHwwVhIo@vger.kernel.org, AJvYcCXrAKyxpq2q2amC5SnuWjnXwpb3uGI0G6ImwnNWsRq+Sqz6QhoEARyv2MtPa3FjwEPNMq3IgFqabNYAXS6kQszh/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gOvHpXJ5R5eLQbjp8hBzAEVIbGD6vRbOhBW2p8gNZZLEDWUR
	vjotbyl/+q1WAyAAFBuWeQqxEW4llq8g7WRgJapjCpiBNZoyZb7RhY91heHbmjk2
X-Gm-Gg: ASbGncvS9DVO1tTjIvsCoR+eyw9p/FFU4Ch9ltatsjfbbVgqonDaOC0YQXQj/EEAg1I
	QOhwIcckRmPraS4Fl0dYT5PTRoFgObDpWtK/XFhoFm+HTBBL+8H9ckIa1NdgOTg34NaVusLlnKk
	pWT8Mi2fKp0SSRPjOWPBEd84j1l5T82m87FUJB/KwAFdf8rw7lGN3oSLluZzroRiRTFFpUWNQ8Y
	QJi420O1WAfWG6u6L0qU3B+t6/v34N/nFJWtdD9QODAdCqWxqSjRqPGmjMJEr1QpUGs41248otL
	uJYMLEQMFtlOFAeHblonabjxokWXvffjSk3OHi0cajfliUAQNgu+mp8iphsrnSEaLpIjpZtNEhn
	uAckFESfgNaGkkK41+P86DnyMIUjcVsMXLoQNFtn3ZYm4vLEp16DOCKVyA5VY
X-Google-Smtp-Source: AGHT+IGDA3pP6mGA49mNLxq9UAPmSfy57hmyRfEwFHYeSdMldLyHzjN+VJ9/WzJD/EjyiZIMkdMQjg==
X-Received: by 2002:a05:6102:6c3:b0:4e6:d94f:c197 with SMTP id ada2fe7eead31-4fa3fed06bamr5302311137.23.1753773118543;
        Tue, 29 Jul 2025 00:11:58 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b8dcd50cesm1671590241.15.2025.07.29.00.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 00:11:58 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-886b2fdba07so1592017241.1;
        Tue, 29 Jul 2025 00:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4Fsy4sY04K4IWoUtTAyHS3kkoCAxecloHEPo5jhm3PqRUgddbLIDsZNzxNTCb8cMW9FcaTsu0Vd2zlVjhyLXU4g==@vger.kernel.org, AJvYcCXrEz1XJjOOyZHuxDcMo+CcyaZDfjdStovPyS/blCNfaOUvr/+UB8G7TRpaKFzTboHKQmyE63Lo@vger.kernel.org, AJvYcCXyFoZyGWHzlW4CbiVsrhP1IWuMyEAj9hYLAjwC3Rin4orxCs5B+iOklGrIMYBgEJyGS6/D5LMrnFv3@vger.kernel.org
X-Received: by 2002:a05:6102:3f53:b0:4e9:d847:edb8 with SMTP id
 ada2fe7eead31-4fa3fa68bd3mr6449966137.7.1753773117534; Tue, 29 Jul 2025
 00:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
 <2025072828-suspect-work-12ca@gregkh> <b9c9ba83-6da2-4295-b058-a0520c9df806@mailbox.org>
 <2025072931-bagful-jelly-ffa7@gregkh>
In-Reply-To: <2025072931-bagful-jelly-ffa7@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 09:11:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJQ2iUwNvH+APo0tFtbWfvoBvtFeH7Njej9sANMKtzZw@mail.gmail.com>
X-Gm-Features: Ac12FXyXvWCK7x2sjmWynrmYsSYSUy4D_IU-4-FR6o9hoO4E8HEeJAWFQw0ofck
Message-ID: <CAMuHMdWJQ2iUwNvH+APo0tFtbWfvoBvtFeH7Njej9sANMKtzZw@mail.gmail.com>
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, linux-usb@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Mathias Nyman <mathias.nyman@intel.com>, 
	Vinod Koul <vkoul@kernel.org>, stable@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Tue, 29 Jul 2025 at 07:03, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Jul 29, 2025 at 05:09:55AM +0200, Marek Vasut wrote:
> > On 7/28/25 6:18 AM, Greg Kroah-Hartman wrote:
> >
> > [...]
> >
> > > > Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
> > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > ---
> > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: Mathias Nyman <mathias.nyman@intel.com>
> > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > Cc: <stable@vger.kernel.org>
> >
> > [...]
> >
> > > - You have marked a patch with a "Fixes:" tag for a commit that is in an
> > >    older released kernel, yet you do not have a cc: stable line in the
> > >    signed-off-by area at all, which means that the patch will not be
> > >    applied to any older kernel releases.  To properly fix this, please
> > >    follow the documented rules in the
> > >    Documentation/process/stable-kernel-rules.rst file for how to resolve
> > >    this.
> >
> > Maybe the bot should take into consideration Cc: stable below the --- too ?
> > Or is that considered invalid ?
>
> That is totally invalid, it gets cut off when the patch is applied and
> then is lost :(

But the "Fix" keyword in the oneline-summary and the "Fixes" tag are
not, so your stable minions will still take it ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

