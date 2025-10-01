Return-Path: <linux-renesas-soc+bounces-22534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E7BB1760
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 20:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 899923A11CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 18:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FF92D46B3;
	Wed,  1 Oct 2025 18:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FogeFqwE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E02D46A9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759342514; cv=none; b=fZ0XZNIAElAUuLMmeySE3lfhGKOecQSC6PjzELTdV5ZqKE3CrE6Y4Upcn7Ee3qv/dbi7/iWBVofGoN/srjycAOMRVvvvCcZpNTM6x1faCI5BO9SoJ8RIiXPPqoCEZTbKbU/SHONIYVj1d9g8WRZgrcbFV9tcbZMU56mzZ568iG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759342514; c=relaxed/simple;
	bh=IKPYXw7CIhCfKTdGMAlf0RUh6f8e+twBhgb+c0os/9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHXrcn3/1M6ezkwM3jW0zsgZCJTnG+XJVfpxY1pm/EYtRtJGK+1zzh6iuD6c+oaqF3MEWR6uZ50uTqFBveiPSzG2B0gkmxCYBIp1hjjXj02DJe5M5P4YPpubOSljsacDuNzDHKUflS6qOypGvwyGuIFTOJdt5VPfqLqoV2iPGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FogeFqwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3558C4CEF7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759342513;
	bh=IKPYXw7CIhCfKTdGMAlf0RUh6f8e+twBhgb+c0os/9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FogeFqwER32gpvXetfpiBseQBzGaPT1viNx/zNJ0h+EajU1PeJR/bhSC8DbuOiT1h
	 kQ7mVVzzngUW63HZAbdch0ftZ2Y6WGINvt5mcFsoQJRgyQSq+0ijy5BTI9t+BY1JOq
	 bRpq0Id7etCAmdyfBjv3s+eteuuxOg8hxrhkT9ZuHSmy1LpSCBNc5z2pNiTuOOfAdZ
	 Bltivq2MTQEnJ/I90ZmL1TOaGahKxGKU/265nZ+9sc1oGf3aoKonNlQJxBGJj3Hvd8
	 vBtDR7kB9IckLFANmhUXxxsPS4+ADJdLUtPrnUsqrq8AG/8plWMfKxSUbuYbbK43bq
	 w47HvAn3Kr5Og==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4736e043f9so41131966b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 11:15:13 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy3OlQSB18jMXgG531zVeaWHThvCfUjlxmDWL+DPIL7UG4kjwm7
	ZyRSV4XqDEgzrojR91j/lPe+CAuzHO2TPqpktE32N/+so0/ItWvzjEoIvsphGjyDk1wXaUrkUo+
	v1X/4p3mGFu2ZKnYf/mIjoMn3N6JAGQ==
X-Google-Smtp-Source: AGHT+IE6k8jT8P3cEyZLzZPg2Br8moPxo92fNy8ZlvuKtn9pVLTse0NexLbiWmnweSHt8Tx0hzLqx5eqS2EbwyjiAXE=
X-Received: by 2002:a17:906:1c0c:b0:b47:de64:df1b with SMTP id
 a640c23a62f3a-b47de64e296mr175579266b.39.1759342512155; Wed, 01 Oct 2025
 11:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929072306.5634-2-wsa+renesas@sang-engineering.com>
 <20251001125149.GA1122744-robh@kernel.org> <CAL_Jsq+Rnmv26tjOednFuQkLf0hwfMU1xihLT+D6aym0SigNng@mail.gmail.com>
 <aN1sjfECC8vVWngL@shikoro>
In-Reply-To: <aN1sjfECC8vVWngL@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Oct 2025 13:14:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+9YjrD1A_BfyJ=S584qY5UaEwJvXqQKfUOADfL-rQ8vA@mail.gmail.com>
X-Gm-Features: AS18NWAKpYzr27MqWOjul0DoDbygvrxNJaAlCObftxsp1Rlyvtj75B9LyFfNQr0
Message-ID: <CAL_Jsq+9YjrD1A_BfyJ=S584qY5UaEwJvXqQKfUOADfL-rQ8vA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: dlg,da9063: allow 'interrupts-extended' property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Steve Twiss <stwiss.opensource@diasemi.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 1:01=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Rob,
>
> > Now fixed in 'main' branch. There's a handful of other cases fixed
>
> Confirmed. Thank you a lot for this!
>
> Did you already clean up the reference I got this from
> (mfd/samsung,s2mps11.yaml) or shall I?

Probably should wait a bit on that until I make a release. That will
probably be in the next few weeks.

Rob

