Return-Path: <linux-renesas-soc+bounces-26516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7344D0A696
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 14:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 204833017C45
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 13:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAC635BDAF;
	Fri,  9 Jan 2026 13:28:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D094328750B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767965303; cv=none; b=JqkaGuRqTW26WsI2rPvZ+ciOxALucXDsBa5pCOrTliAGEq0eBLIgfdRf20yvuweL39Ed+SlTGlXCjigAP5UQV3wNZc2O9vDle+1vBvAZCLvwsApYYFch68lCqASwfRYJPKATLkRbGIEEBH0/fh/ZYs0EeTQUxandWYsrWzTIac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767965303; c=relaxed/simple;
	bh=1L4cZo3EX6X2INs8QItbxpM2uckTHwqOzvEIQWAvQCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cg/bQuy03poyTl50U3lA7dwJL6O1Hdv8lltAOGwynA9bpAz8N5b7VnXS4nU3EU6wnjvS1mpSs/en+LIw6cPZbpUO7TppPEcdefuGySl0T28f3OVkkoOfPbArXvurmJ1O/wjYKdeiRKX1k33uWf9XF9rSs+iptQmomBD4dAAVNPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f523bba52so2121793241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 05:28:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767965300; x=1768570100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNFPugqE664J76/2PrjHrid00raf31+fo6rdSr79tJE=;
        b=xO/OYqTIcD/TTPoUADGUx6j3sju7kPFOASru+DJRXKxQLMloxEFKtP72UQQBvFTGHJ
         sqPY0OBuAoRCnnrFoydpc8LfE61uqOE3tBalD1QHLX+8yWAFpw2E1hwHwz7JojHNfD2P
         ccf66t+36TayeSIypyfQYuYR8l+18GMuU7mYgln+oOlHMc8sP0kRFvdrQzNQw7KjEH/2
         J1hLi5Qdz6cZkWetsJXF96k3cnWPqR5SKZyrV3DU7mhzub+vHq+RTv5IYThx44r7jSAE
         JtuyiFNUTRqu7dier6wiElsQKWD1QTYOymg/7D+pNeod6A/IHgWmA9YWZSkWMiYg5E7W
         fqCg==
X-Forwarded-Encrypted: i=1; AJvYcCXx+oxIpouN2ynrb26UiBFQ9ujbLml2wEE1pHuhk1cbl7XH3/Yzt06T7sYDrq2hINb+0trKuFwaWjqtrg6Y7/hL+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUta2Nk7jYHhQBOh6EKhccApqM9GIVGgnfHC4QvsPfJ3dO1Ht
	ZIhx12pvVq6DoiojkXqRKX3moAIklt8151pWO1wVvcy77WoGqYeJmWVhJtTD7CoW
X-Gm-Gg: AY/fxX6yy20Jc4gO6JpVqqkvxhIhqrhmtdY0a9UQzMY03I6d8HPI6SQ+TU0hvM0/+lk
	B3VClR/3h8K9tDv4VUeY1gfi2V/eJh2MvFEhhe4PM0Kx2IxnMWvf6DCb2pt4COeDj/a8tsu1U65
	BHVxH0Hr4J/gK07QHDdHUcI3969jsWXic8YJq7H0m3Fv4KWj6XSQOqJeOLhYBkpbTE7WR7Vu3pt
	gnZmbZp9iMO2TXT2qJtQBVbEeVcliBTFsMX6sq/TVsLcajy4TiCfM6hFNKsVWcArWQhSttFOojD
	p60gFdgf03VcY/WyOccMasjQks4Fgy1F30/YvHqae0Vj7fXnE864yf89plRXvg+crskAby5fkDz
	bQinIYLlOYt833kkWWSI6lu3bBw6TWYt/DtlQDaMW+mBMKzW2K7TzCNyEhapnuayu0W0KZebkIH
	t1x5ZY8aizOcwuAGWu88Lb2t8j7a06Rl6zeMxSs63LWa/fB4SD
X-Google-Smtp-Source: AGHT+IEd58H0+gz+zDbkCpXdmG01BDfSPtUCt8dfNTaVFiBC3UOfzDsU8OWZOVGnk9LxWB+PX0095A==
X-Received: by 2002:a05:6102:4a92:b0:5ee:c3be:c99c with SMTP id ada2fe7eead31-5eec3bee161mr1652552137.19.1767965299623;
        Fri, 09 Jan 2026 05:28:19 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec770644d5sm9319368137.8.2026.01.09.05.28.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 05:28:18 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93f63c8592cso2006645241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 05:28:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTRJ/DOk4fKYqIEPrltNlpojEcvXNkWl/GBKhwHDmrfonYQxppp3CyYXr8c8HWeb0LhMLKXBoRK5G2gXslfQQH3A==@vger.kernel.org
X-Received: by 2002:a05:6102:4485:b0:5ef:233e:6b25 with SMTP id
 ada2fe7eead31-5ef233e6e06mr1027510137.13.1767965298725; Fri, 09 Jan 2026
 05:28:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109123828.2470826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260109123828.2470826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 14:28:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWz6_NzvjZNMLk+Bqoa0NR2CKNFwDXynfmrTZgOGsqxTA@mail.gmail.com>
X-Gm-Features: AZwV_QjPN-Mv2BgxTufNwYwKmRE2uazISkHQ_FJOwRqpRjGwaHZxOt7DyuKNXD8
Message-ID: <CAMuHMdWz6_NzvjZNMLk+Bqoa0NR2CKNFwDXynfmrTZgOGsqxTA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Fold single-entry
 compatibles into enum
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 9 Jan 2026 at 13:38, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Group single compatibles into enum.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -20,6 +20,8 @@ properties:
>        - items:

I the "- items:" can be dropped, reducing indentation of the block
below.

>            - enum:
>                - renesas,scif-r7s9210      # RZ/A2
> +              - renesas,scif-r9a07g044    # RZ/G2{L,LC}
> +              - renesas,scif-r9a09g057    # RZ/V2H(P)

This block now indeed contains all single compatible values, but it
is still located in the middle of other multi-compatible entries.
What about making it the first block in the "oneOf:"?


For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

