Return-Path: <linux-renesas-soc+bounces-15853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D404A86328
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 18:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD8908A1CC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 16:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB1A21CA07;
	Fri, 11 Apr 2025 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHtsDDWN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5126219EA5;
	Fri, 11 Apr 2025 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388625; cv=none; b=AR+Aoy4kPAXc93AwHOeBR78QECqS2HRebytPNz0lfQYPJ61v2ba0wburnuyZp9og0pTpOU76YpIn1rH2vREj6CLax5rdl2a604ptSlos4qlW7IQ/8bXC2MBYz6MWFiumeCd1g6PtFi6nUHc8NORoMp/fVLEv/g7nho4N/SwrC9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388625; c=relaxed/simple;
	bh=g/pganQZSx52qNp6jjj4GSiWZuSgoU31JNjxvldnCLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxvSvVoKhBBgg+bCDItkQzAor2QJFi0XZ0FFVJ22ABVmw0PWQAjWktH7zgbdlXpe8EWDYedts4Rf2jyqokwTTPmJ3oVqPse3OdYZ3N3Saj9KdOJQOlUKVvAW16+j53j8ghBpE+FqAh/mxMQ542MpsN1vIw4ZEWzpZ0iKlY8hZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHtsDDWN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAB6C4CEE9;
	Fri, 11 Apr 2025 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744388625;
	bh=g/pganQZSx52qNp6jjj4GSiWZuSgoU31JNjxvldnCLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uHtsDDWNjwBYEsmUM7icr8cAnu2sgZzilRSQvSL3Yt1whdK8e1N+aYVlAN1f8VjbE
	 2zgXB7F+y6eJN9vmMe+H1sTDswCA0YJ8RQKZQW16Fbb1Qhz8Ii1hnXnnX6rLI5VQOj
	 KRTvi4M+TicjxkBN0pgY0QV9H/Pt54+mqqFuslLN5t5FX6/n0FBGBFYhnlPVA/cZta
	 UREhHxPocCfE+Mpn6qwVMJLfZozBpmWLpXDLwks/1VtgfYowsPtEpK6lRunAQY5MPg
	 5eU8pi+mQc/hbeewINYCvgL74wwCclCu/GE0a0euqWxWUS/XkDzvFIRiP/rnltPzsu
	 2FTgS5LM+GFCw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so3945613a12.1;
        Fri, 11 Apr 2025 09:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJuhffQzn/tqBC8D73jaeGFwGOnRdSuyShytGatuj+5XLPDfF5jmdhxNz+aoVKlM2gRWODSCsdJTxeq2AB@vger.kernel.org, AJvYcCXGiu1uCnBC1N7ujJ/yJBTbEtyK/8T+AnUi3Gw5uBrv8LiSQ1tr+Q+YaUySfu7eWI71ro9C7CS+uovP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2EFcnY7Rce/cRd3SpGlqGs/0xaKmJ2HcNVIAiqlHp5RmzD6dp
	Ve49G7uoX8miJXiRCOXUEght4sGRNc0RsXuAK+9jp+kXH6gHx/phEIntRgGNZPJr88sKKtkfE4G
	AIcyUP5b6F142e9KQ3yrcc09qMQ==
X-Google-Smtp-Source: AGHT+IHuwjMlWSeE9LYHHyXbSAAkws9dKvVGcB21xtxVyLv8RWBNnUWqa03IxQZN90/AdHGNnORtFsNCROVqplN0GiU=
X-Received: by 2002:a05:6402:51ce:b0:5e4:9726:7779 with SMTP id
 4fb4d7f45d1cf-5f36f78034fmr2576755a12.2.1744388623871; Fri, 11 Apr 2025
 09:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411155220.5940-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250411155220.5940-2-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Apr 2025 11:23:32 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+DOp8YOcshTVqYcbmgbuc4etTQeeswmMUYjw1sws4mAA@mail.gmail.com>
X-Gm-Features: ATxdqUEZECOG4IEUcTzedr2PdAn1TkrPnqxsawpkiGmWrIvHKwA_4AUJi0ReCeE
Message-ID: <CAL_Jsq+DOp8YOcshTVqYcbmgbuc4etTQeeswmMUYjw1sws4mAA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: remove N1S binding
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:52=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is one of four (quite randomly) added bindings for Renesas RZ/N1S.
> Essential bindings like clock support are missing for 8 years. With 6MB
> of internal RAM only, N1S is not a prime candidate for running Linux,
> unlike the DDR-RAM capable N1D. I could not find any further activity in
> upstreaming N1S support, neither for Linux or any other OS. So, remove
> these half-baked dangling bindings which are incomplete and look
> unprofessional. We can happily add them back if somebody offers complete
> support for it. Until then, let's enjoy the easier handling of a single
> 'const'.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This would render Geert's cleanup unnecessary:
>
> https://lore.kernel.org/r/90c7aa143beb6a28255b24e8ef8c96180d869cbb.174427=
1974.git.geert+renesas@glider.be

To repeat from that thread, IMO, whether you drop the platform is
orthogonal to Geert's patch.

Seems like the platform is pretty dead. If you want to send a single
patch removing all the bindings, I can take it.

Rob

