Return-Path: <linux-renesas-soc+bounces-14870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF2FA716EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 13:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5B23AD73D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 12:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3271C6FF6;
	Wed, 26 Mar 2025 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grnt17tZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA6B1B3950;
	Wed, 26 Mar 2025 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742993566; cv=none; b=a5djTvTjrJk4mige5GLOTDBWuVvH10BoVeuS7H7qiaOob7CbD1lxI55/I+tvVXSc3zRKcNGN627pTA/AYBQi5f04DmvwZqyqgIOMV/Wb8fPy2CrQZXOAj6ooRUO2DXy+QSbFD1fQIHRRkxGAxPHF9IFMdQ16IyZCUAIfCd3f7yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742993566; c=relaxed/simple;
	bh=yCg1rgqOSeu+rLDpXWfBkyZmFWl++cTnnHvhB3T0ZmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XC+CEYJ6L6bF5jqYGv8j36q7HVfgr0MFS74hIcpigkMgmDRIFplMlzWH/oF30BT1lfNjb3FzAahVRTTZIsinWoLrIY6S2eajptgYHjn6hAUU+ggQpg3KqebDNDO+J6fsQPhHERYRq03sf/n+LOSy2qMXV/nTLtCzIK0smbFSdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grnt17tZ; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-521b84da5e9so2896550e0c.0;
        Wed, 26 Mar 2025 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742993564; x=1743598364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCg1rgqOSeu+rLDpXWfBkyZmFWl++cTnnHvhB3T0ZmU=;
        b=Grnt17tZgotgkdQ5lzTM7aeNu1bWMjxHTs9cVU8eEa/0xmudI2zh0GiTwl3S59jl4Q
         zr2rdvaCGvWwYrMLHauKKWNl9zBdbv41ITXaDF+EWRdJab5cjbp0LgIO59Wmry9g6qt5
         bswCBMhqrfwz/ipZB7BhGWdos0ziZK+rBddTmw/czO3TiNeX7nss22nvbRJ8rekvnrEn
         FSvWMe+iR34CEeE++Ri2UkRKEdRaH7Kkb13SNvp8EWqWsUZ7wqGg8kGgzgTvD2FkxIJg
         Qm5cQWopsvqL6AOGOkcLtR+UB8lxzUCMQeGzc6ZavbPxo4vjeO8ZBTVb3TGrv+Cr7spY
         SQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742993564; x=1743598364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCg1rgqOSeu+rLDpXWfBkyZmFWl++cTnnHvhB3T0ZmU=;
        b=n9zAEuYgIC1+jC7i/0gtSoFhEp8zpb2mkpScLAvqz0x4LkF4zQnFgEoFCI0PAmiIsj
         rzT4KllI0jwuPrORvq1c/OzYj2GI3Yw6/OiX+zotHPJ3OtxS6sQMBolUXn6NZEiZ0bXB
         v0rFD3kUH4JzggGbKuhhz+U+vtx6W5jKDtBnCtVJMxuIcYxmCRWtlNPEsR4mDLMThzT6
         oVgF2qTGP/PWz3kR0RgrVOyBDyB9hqa4oe60TEqvjMtW9nWpAn1bCb5lzgB6XU7p/XnN
         /nGWYiT76Y6fTlhnGoOiHv399plSglSawYLfDJuEtsm+sEfbu7uBgv5qC71/CR5Tt4WW
         ZLgw==
X-Forwarded-Encrypted: i=1; AJvYcCVrsHXvY/j9MN49gE95JfJVmepR7U4/R+/l8JNxIzArjWuF3Q5O6UqBXr/8TnhPAtwTZjsjsfjQU15k@vger.kernel.org, AJvYcCVvVBeHl2+USTU+RtYGVb9Kuy/UoQ3uPyA5ZsvtV5MdAW5vqx4bXAwl/HagQI4z7KRyuaZMWrVKxA8FW3WK47eP4KQ=@vger.kernel.org, AJvYcCXR8tiUJqDvc6+kuDNm6mGKZYUs5yPmpqaoxTRYI+VUycFV1nz/9guO8U/YXcNzzIA21g9zQK9/buGszIA4@vger.kernel.org, AJvYcCXS1HFEx0urdAzykKW6zJGWG/97eeuUxswK+RPJAWI1C6ZNKaIfMjhVlxqKIkC4pj60Y6zkhNRW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MyKTjdlI56ySrux3riPwSEqUmApHWZ/uHOUVVYUM2rlpHwFv
	R3dDrq3l+Zu2+jTN7jxIG1CoAAo8pLcONCCDFasivW3X11F2NQERxp0IkqdpBvWCzP+BjcaZ4MD
	mirOsooeETzutSvjIhzdLu65moho=
X-Gm-Gg: ASbGncsliD2LsrinKJRPFZA20obnS+PRXxRHZ0P/bHU411JiXIfdenDZfBr4CidekH/
	izVi/Fh4H19MD/nUeoQGAsXSGiBq/CNr4Vlr4M3BHSZ+f3suxC01PyxzAERQEjAnlqYc7XCrQeS
	93h5dA5aHcbxtRBCCF9rwjzobtbYwyIWhagGRtV8jTypfWwjUGu9oofbbcug==
X-Google-Smtp-Source: AGHT+IF2GYlRCksm5iOmvAw5h/Nm2NCHn/eSKqWf0IIrVguqLczqhR9m/OA32gWx7ZdbP9xEUZ5cFF4uby3trZm3JSs=
X-Received: by 2002:a05:6122:614d:b0:520:652b:cdf9 with SMTP id
 71dfb90a1353d-525a838806amr14632718e0c.5.1742993563651; Wed, 26 Mar 2025
 05:52:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Mar 2025 12:52:17 +0000
X-Gm-Features: AQ5f1Jp8vxfqG0NLOvLDVY_2Yq7ayGqmlj-XifLUdImduJ_U681u5FCcCZ32CJM
Message-ID: <CA+V-a8tBh1Ev-8=0vcmz0XB7iqKzZZ5dKefrZCrY49Je3KTCAg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
To: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, netdev@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo and Jakub

On Tue, Mar 18, 2025 at 8:57=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series adds support for the GBETH (Gigabit Ethernet) interface
> on the Renesas RZ/V2H(P) SoC. The changes include updating the device tre=
e
> bindings, documenting the GBETH bindings, and adding the DWMAC glue layer
> for the Renesas GBETH.
>
> Note, this patch series depends on [0].
>
> [0] https://lore.kernel.org/all/Z82tWYZulV12Pjir@shell.armlinux.org.uk/
>
This patch series has been marked as "Changes Requested" on Patchwork,
but there were no review comments on the series. If the status was
marked as "Changes Requested" due to build failures reported by the
kernel bots, I=E2=80=99d like to clarify that the failure was caused by a
patch dependency, which has now been merged into net-next [0]. As a
result, this series should now build successfully on net-next.

Please let me know if you would like me to resend the series.

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git=
/commit/?id=3D0c1f1eb65425

Cheers,
Prabhakar

