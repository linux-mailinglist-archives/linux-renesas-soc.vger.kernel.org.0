Return-Path: <linux-renesas-soc+bounces-10572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390089D198A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2024 21:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC07EB224EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2024 20:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A7B1E1027;
	Mon, 18 Nov 2024 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/jU1AoC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE3814D2BB;
	Mon, 18 Nov 2024 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731961197; cv=none; b=bQSDrU+WY4o8IM8Z9mOPgvniJ3GBEkrOUmac5ECXqCyDkpRiFQXPyJhqIZOb1dZc90yf+Vr8u0DXOcJrgGO7gQXhOXraHgvZB37AmUTu267uBBY+MUwH5lDsrzCtLrCvTZBgMD7giA5Qj3Kk164wlGwooIntKnHQX9yLi11sRTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731961197; c=relaxed/simple;
	bh=oqc9MQbspo8H9Zcz1ill1uclc62dJI8etdU+Jyax5Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JI0oskFJdhBwGoD0WLB97+Sycd2a5P4Uukn9JzOdfDZizL5gYSc3BOAgCq3KSoTfru/sGdBN380tGjqWJFrJZ8y3xndoup+UpwvwEfLJmaitL145r1QlaV87kckzzckua6euf3ltsH2985OVjUBwn+Ee2yK8tjnGLtV5vV3m0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/jU1AoC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AAFC4AF0B;
	Mon, 18 Nov 2024 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731961196;
	bh=oqc9MQbspo8H9Zcz1ill1uclc62dJI8etdU+Jyax5Oo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U/jU1AoCv4XqtWA7Kqs5lvLPMyKVVxqRRqfdOvxNl0sqg/Oz8+BBe/ICDa6c+4i0K
	 Ypk9OuK2CONkU15IxDkHLuTMphgmT2GhPRLUc7+WvR+mYGXWqe88tbkEAkziN8ppuU
	 Xr7wcJnWn3jd5UDzYIsyQIQr++p88U6k7id/t2b2dXeglTZPoAi3/ORyBAIHa/gyS1
	 1bdplthpN7LsQM31iTE51FluBSu+jnh3Fuz+cQ0QVBSyRqL9GVVpx7SS8OXPViySBg
	 kD2lu++N72u/6GnWvL5IFdCb2D5BhmXrXUoxXrSpZppOdBeyOYLBgUpB8WzNQLNKGK
	 G6cElayTBCypA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e9ba45d67fso45892267b3.1;
        Mon, 18 Nov 2024 12:19:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlzVoSt7CS8KIZzafUOa/JtlEUz89wMv/60iLNKSuv9TXrUJnbspLsyVPSuefqi/fwySu5t69tgehCXiGbj6FH7LE=@vger.kernel.org, AJvYcCW55xvwBmcT25kmbxaAULw3bJSLYPgFmF3mHJqUDW+bcp0XMEfpoacEdvjD1+3zfkjntyMVAijijNUVJMBQ@vger.kernel.org, AJvYcCX3Y2KwjrCMXYyz7hY8KQB8bQKnSfizNPDgFHeeYoYCmZRHNOy0ExZjcFbSmKiJIpVG95QmJEK/ijsh@vger.kernel.org
X-Gm-Message-State: AOJu0YwEz+N+CNT65nPYVRmjb7fl8Z2L/pi5lgM2Kpxb3oini/TGrrEv
	+k6Ki9klhKq2ZMn2c+MH0enrA/SiwlN3NNOX4hyxMkpnheJ3+9ckWuddw5QlqCVcwUk7aWiPBhL
	ACRiks00dxCPWmVJI9WbrVrGLpQ==
X-Google-Smtp-Source: AGHT+IGVTY+KxKz7I7bGRzLljhpEqdXXlPFcDGIN6A3edYN00yljzh7MPFOegvKHYkp0012p1HVz0/xpidNiTXtNIr8=
X-Received: by 2002:a05:690c:610f:b0:6e7:e76e:5852 with SMTP id
 00721157ae682-6ee55ca37dbmr146529117b3.32.1731961196054; Mon, 18 Nov 2024
 12:19:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113225742.1784723-2-robh@kernel.org>
In-Reply-To: <20241113225742.1784723-2-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Nov 2024 14:19:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+=DzjZCDC2OxL4wTueTpFv0o-Ah3RwzPZsbQ8CLFY=qg@mail.gmail.com>
Message-ID: <CAL_Jsq+=DzjZCDC2OxL4wTueTpFv0o-Ah3RwzPZsbQ8CLFY=qg@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,ether: Drop
 undocumented "micrel,led-mode"
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 4:58=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> "micrel,led-mode" is not yet documented by a schema. It's irrelevant to
> the example, so just drop it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/renesas,ether.yaml | 1 -
>  1 file changed, 1 deletion(-)

I see this is marked rejected in PW. While there was some discussion,
there aren't any objections to it. While micrel.txt binding is being
converted now, there are some issues (with it and phy bindings in
general). Keeping this property in this example will eventually
require some changes to it. What phy is connected to this ethernet
controller is beyond the scope of this binding, so having a specific
phy is not necessary.

Rob

pw-bot: new

