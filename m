Return-Path: <linux-renesas-soc+bounces-23484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB51C00930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A846B351D11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 10:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C50F309DDC;
	Thu, 23 Oct 2025 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNQZ+/yO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332B430ACE6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216704; cv=none; b=EQUxfEcXmivgenIpDm8U+Tj+sx3TUbFzjZgRaIq3Mxs+oI571n5JBsVKOkxju6QVv0bXahkjrF1qy1itd92/CIeC/xwNfYKj6xjhSP9ZK6yAbzVV5/QHFBfbPOgKtCK4r9gopvI59Nxk0gvnLDXgltJEJUY/3C4XbPIfxIInb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216704; c=relaxed/simple;
	bh=9nOGCAjhfRW/rA97w2j13qaEfOW0Utgue9GQrZT+8Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lx28KnspKBKitqQhARd3p2BQ+9D3xvdmTIm5xPOeLGHSPMOjD6GVBRC+D1gj9Kfg8eJe0ectTypYhD584Gv/K974nxWN/aVP9THa0RBFyzsFrJFgq7ya9UH4MHtWP9ggttARoieXlicNbP9CK2T1AEQLMHuc5cd+KAuyJEPJcic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNQZ+/yO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee130237a8so398899f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216700; x=1761821500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nOGCAjhfRW/rA97w2j13qaEfOW0Utgue9GQrZT+8Kg=;
        b=HNQZ+/yO7YKkbzyMJSOt/vxKPskV5m1iW3CZ7Pnx2E+q3B36bJqiSf9KpWNpKKvNdF
         SNkubrLefH5sFJHYvz/zRcseYfTYaVNkE5OpSCzNUCV01rdg6ZX0XUXB2BHP3zy4rZcH
         vl3gL/1sl7SGH1FJBKEI25FEHVtefoPf4vD2/xFQ4QR5hSEyY52SbcUJbGQtEzExPr5C
         U8T/wse8NzoTi5P11gSsFY3LzLAem0ZR5vaemqx4Qyf1+KYftNQdb6rvw4nyFZEEizPo
         axrD+XCAOSoxV2hg4qfjyr7WF9JwA7GvDUdsiDzRuWl7hDEmSvSqeJoOP/PQ/jqO753f
         ePIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216700; x=1761821500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nOGCAjhfRW/rA97w2j13qaEfOW0Utgue9GQrZT+8Kg=;
        b=TSy9J6Krr5z4l3hPuIVdqQbPhEC8Ec1+x1BAG6Cw3NxlCxTa6mfdpCP7+kdAz6BBqq
         pO4GPljC2pPcqmYqeWE/RxxNiLSCN7nr+5IafRsmbq0Ad1388DtZMMYPErLkjga7SAkk
         nD5opcAnKdQY/K50/aF9VcrViAAa/OdAcCFa28NofsNKh0q/lEq+Gp9C9Qg19kKu1FVT
         G6FzsiQtDcGo2zFmVdJFPSIuktnzpQCHJX/H6M5DGl8IWgMLQyVBeoEqZBhIIJ5WmBZP
         A6QlMa3kCX8IV68u8eXXO6h4ohheI9U1u/Qe2zOOkWGokaj3UpXSS0/biVk6wBV3drHH
         K0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVRMmv9TTk5lR1yHzc5jw0nmPTwYj+1/oyQxI1HPMXs6AhCWoHOoonvfINsh1r5WZdkNFCaVSOzNDQ3yPviVQr1SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvX/iW2HCwNzRVmtZsdVSoaUsqNEfVzayUarwI9DxxxxIIegu
	ci8niU7mmk6ZrgMkQJuFqZAaZO1jxxMhQ0ModPp0nXGxXp5N1jEU/rzEpZ+6+lbxdmM6HufNoDk
	TptQWKxPBcpNKXTaJb0pCpph8tW/si/s=
X-Gm-Gg: ASbGncuMwpaMOWuTwNW+t6fQ/n0b6CcbCHeMk0FUkfJ2uC+EQc/dIrXDCvQFk9qHvEh
	KFVXQfDFp4nQe+Xsi7N/8wFSNqlT9MWfW1vKzlZFKvZTha1LWnxhNNWVmhld/bTJELXDLxeGrwC
	zj7pOLEN723gr/KHGLspW+Lxb9nmI0bcy1ei6VwRu02gHMQLE1GDu7lg98d/f7ajWGnhlJWU+TF
	OPtsQtZvZxhPU7CluXoKm7d900+aR3couabJ0Mm7ep1fiLlkb6vc8i2xdfVguEQFo9dnIwE
X-Google-Smtp-Source: AGHT+IGc8Zr6ZHZk/XnNfwwGlbXUYEVek6pmNdJwArcHATOCBwaP/Zs6qyLU5fsWQ9q90QkFzK1qEyjmZ0EWfb2kxIM=
X-Received: by 2002:a05:6000:4606:b0:427:608:c64d with SMTP id
 ffacd0b85a97d-4270608c806mr14232913f8f.37.1761216700403; Thu, 23 Oct 2025
 03:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251017151830.171062-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251022181303.3dc4f41c@kernel.org>
In-Reply-To: <20251022181303.3dc4f41c@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 23 Oct 2025 11:51:14 +0100
X-Gm-Features: AWmQ_blhVXyZRFlAYOOFzj40YpCvwBsR9vUPd4CfvpYi-qsCy1xcznimtCK82Dw
Message-ID: <CA+V-a8uMpr+-F6gQZ+y6wrSUfV5BXV_xDaZcLVnwdpiw8g5W5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] net: ravb: Make DBAT entry count configurable per-SoC
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

Thank you for the review.

On Thu, Oct 23, 2025 at 2:13=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 17 Oct 2025 16:18:27 +0100 Prabhakar wrote:
> > The number of CDARq (Current Descriptor Address Register) registers is =
not
> > fixed to 22 across all SoC variants. For example, the GBETH implementat=
ion
> > uses only two entries. Hardcoding the value leads to incorrect resource
> > allocation on such platforms.
>
> What is the user-visible problem? "Incorrect resource allocation" could
> mean anything from slight waste of system memory to the device falling
> over.
>
> If it's the former this is not a fix..
>
Ok, I'll drop the fixes and cc to stable and send it for net-next.

Cheers,
Prabhakar

