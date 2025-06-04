Return-Path: <linux-renesas-soc+bounces-17856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A2ACE435
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 20:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D353A68AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 18:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB171FCFFC;
	Wed,  4 Jun 2025 18:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7UbHZn+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0782E1F9A89;
	Wed,  4 Jun 2025 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749060879; cv=none; b=A4J1/GuXW9Yk71U/HLWtns7N+hlqNAyKMCpBgzhAMKxWBr6MEsEuseknfVqn91pR73Bos1VKq4JQ7HzMjazktWU2VeXu2nECA3hEFwdE0BDtDRZ8MSjViBRt6G2DLNH7FzeEaVjUEYUDMLy2/xujddMNiT+yOQqYpPGe7gk/qY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749060879; c=relaxed/simple;
	bh=ehgtzLTDO+WEBHp3jiFE5+O21zqJvWbW0LGGhdbMTFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rU2xDAI1QH/NOmCRcxyohFi7qIq6k+D1k+zn+r0kBXNu4ygj8LkNQmxYI1gfYzalZiTTQmaBOQjcPbVeR9X/f2NZ3dxRzoMDtSBrQy3rgbC6CcUUzfleibICqUYKFoBDkEh7U3+GoZgu+t+mc9SgZr0tmd2lRBmCqWiNJfa9OW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7UbHZn+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a51d552de4so81748f8f.0;
        Wed, 04 Jun 2025 11:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749060876; x=1749665676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aoZzBXtabDZ4ZNWdYqVpRgG+emFPNLC/glUQopk4ic=;
        b=b7UbHZn+HVt3Q/F+rQT8i977QZzleto53Gpbmu0KHmEfCSxV3IVDFVb+KOO5uao138
         G9Jmlm9C4umy5XNBQ12xA6TsbpQJwDwUlbkh1iHZa0NB7pP4KMpyubjliYSxoserSZRN
         5iARlAv7gam03DTdDzbnATNMXk8nRqyTMp8yVfo2Ys8iJl+9EruYh7lv6nQ6G1tKLJz1
         SzFWoiJn15TwxhXN5/cOXV+bMW9Yw0vCro6IAxPUmUo+qjR+EyMhlqCqHGOR8Bn+cqjZ
         /JfgUx6V8tjHGGwj3OPWrZ1w4Lrsnp2wuKL0qrIYUTDkDTS20PubxvcefhFKh0oIJlpB
         Twgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749060876; x=1749665676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aoZzBXtabDZ4ZNWdYqVpRgG+emFPNLC/glUQopk4ic=;
        b=ebCZcotcFKVeeT8UY/NsuSM9oZMHs5cOgr2CzFGIz0v4HHPoi7JvdPG2eVpn5Yi/Kl
         BbHcwdnvnnOsI5Or9N63f3upSq7nmma27NWPPNDThVkXs/0WsHaYKW9xyttLD+0HF7mH
         U6Y4PNFz7iYpuow1MA8e0P1uHaVR59j5u7/wPsEUk+nDCqlNvJqwGePWgkTkupPrO+Qm
         /rxh9T1Se6SHPQX92TMec+9/Pk5vIr0V+pasTXoRYEcyAgny6pzgjsH9+Q15ZMTLtsRT
         zkcpz64EY4Pz1bafbZWzdWbPzNq2CwyLqnQKwknhejLbKnnP8Xf9knk50Cd+uc8RONB5
         4qwg==
X-Forwarded-Encrypted: i=1; AJvYcCUfJtVrw4jAgjUlKVW8dfvdpIT8WtTkEpYPcLvkENOoj79CXrBtsxl/abA0sWKlf53YKIxkcemE@vger.kernel.org, AJvYcCUuOCG6HrBvvnqS70q3dVIeAv6LI24wqltcnu+ows2kW9xDz4q6Ul0i4NeIT8VDH/A9lU8vduiQabM3mBvXAur1sXc=@vger.kernel.org, AJvYcCV+GrAvfSAU9YDFh+Eb9kSDx/I+PP1AuYQyZTs1dU/HSwNAGF/vvqNdQ6LNXqpxccxw0Gv8O7cH7o0W@vger.kernel.org, AJvYcCXTgPETgvVWXATC+NvjLfXdtVeBpeg8xhvV+rwXb8YqYba3Pel3jPjLJB5V2bT1laSUlwcXJ13k7Mz5LEGu@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVOi51CTU819cybAgMw7ylqNiXuUqx3YjHw/8ER0sb7qQ1rDN
	qnr6it0P1qe18M56eBwAu3UBMtTxX345BMXvI85mzPIHOj0OmbR1fQfqo9j92k5L/BB4rYkiGFU
	YmswFmUX0Yj7Qkd+4pWCFmj2A8SFZ/ig=
X-Gm-Gg: ASbGnctRKJ4oQnEW9bmSPcROu2YytqXFaKFm4ivNb94KiLoD6g+ikMumQYsfkLFrlw0
	joVtedTuprMDcDUt0Aab1zeH7v7v6xFCa5E5hud37zWiLes9Ub81RwemRvPrnvNMMPXnekXgqnG
	9vKWrdfLYAIHIOnsfbCt1sOWlC3+/p7WVSCzvLADhBEICE759pqmBHBPN2vEhimHoAzA==
X-Google-Smtp-Source: AGHT+IEFXnFaqjhcI9IoEC+sWC51BhXcOMPTI9Db9Zy1IDnegd1BMkWud7zjIBCg2gUWrap+yi329OY3rsUQOVHAy4M=
X-Received: by 2002:a05:6000:25ca:b0:3a4:d452:fff with SMTP id
 ffacd0b85a97d-3a51d91fad0mr3166598f8f.17.1749060875920; Wed, 04 Jun 2025
 11:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com> <20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Jun 2025 19:14:10 +0100
X-Gm-Features: AX0GCFt6k1sh_fjSNrp1SyZVuu5vH6txeiL7eVP9YJcg7aYzSzipt8rLlAjnyKI
Message-ID: <CA+V-a8uaFOHd3Mp+fwH2i+0=7eUNNrkbpXHFduu9azHA7qS6sQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: net: renesas-gbeth: Add support for
 RZ/G3E (R9A09G047) SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com, 
	john.madieu@gmail.com, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:53=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Document support for the GBETH IP found on the Renesas RZ/G3E (R9A09G047)=
 SoC.
> The GBETH block on RZ/G3E is equivalent in functionality to the GBETH fou=
nd on
> RZ/V2H(P) (R9A09G057).
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviwed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbet=
h.yaml b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> index c498a9999289..9961253d1d41 100644
> --- a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> @@ -14,6 +14,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - renesas,r9a09g047-gbeth
>            - renesas,r9a09g056-gbeth
>            - renesas,r9a09g057-gbeth
>            - renesas,rzv2h-gbeth
> @@ -24,6 +25,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r9a09g047-gbeth # RZ/G3E
>            - renesas,r9a09g056-gbeth # RZ/V2N
>            - renesas,r9a09g057-gbeth # RZ/V2H(P)
>        - const: renesas,rzv2h-gbeth
> --
> 2.25.1
>
>

