Return-Path: <linux-renesas-soc+bounces-27066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7876CD3B5FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4552630210D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 18:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5C538BDB3;
	Mon, 19 Jan 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHvq6RXD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F72ECEA3;
	Mon, 19 Jan 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848093; cv=none; b=kTVkj/Aad0O78L7wVKquq0hw+9c3Bpz0K48pzsufi4I3yh/G/KQ02hkhQHL788H2qRNfIL08wiwYg84AG316pbPYzld5/fywntsHWj94wKK0vgh5mb4GvtUs345yAsqXZ5dQDWla+SMBiYn8ALY2efXsoT/QANsGIvI1bty902M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848093; c=relaxed/simple;
	bh=KAQ8tX8q+bO3qSbrvWwj7NanQMZoHP6DxVRHOxzvxD0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ck29zLfnwdTUswfu7iCULKcD/urBRxaO+j0r6SDkGWXODKmJen3+M798GEDeGiyzgSgZzijBSG5w4WPI47O7+8xPTPPI7HhrZ2FfLeuTt1M0AdmUkuZs54s+WoL9gdZUtIK/+0TF/qJA2D+pZPut1LdGHqF7ntUbwhWWInPvRFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHvq6RXD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5D1C19422;
	Mon, 19 Jan 2026 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768848093;
	bh=KAQ8tX8q+bO3qSbrvWwj7NanQMZoHP6DxVRHOxzvxD0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=lHvq6RXDaA9b+mGiP+hfLlVfpLxQoJ5ai6T8IZhmACaN0XFmkEOTqBqp6dtijlIXM
	 jDoins0oUai8B1TsnX0UxGqUfuCJuXuUbwMP0yTquI4hRvkJrXVNYQhDYM9KVPEop8
	 szuuefEpV6lSc6FV+zmlvbtyqM07xd4FZDkjhXOvQbWsCKA+8HjkMWB0lcZYRltPEA
	 hbQ1qIN12Zyogdm9wGgoX3q2WFzk87QUQWddIi1duDGMdKivQtQSbEEHo1A2NG8kZz
	 cbnC4CIylOu7udE5EhG0m5VQYED8aYUYjowNVD7SpHgjSgoq4We5ae/J35gN9DY5sz
	 s9fReWdvH8SNw==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 19:41:26 +0100
Message-Id: <DFSSBD1SZUDK.Q67HAARLBF1G@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
 <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
In-Reply-To: <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>

On Mon Jan 19, 2026 at 12:36 PM CET, Danilo Krummrich wrote:
> On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
>> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev=
_attr)
>> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>>  {
>> -	struct device_node *np;
>> -
>>  	if (soc_dev_attr->machine)
>> -		return;
>> +		return -EBUSY;
>> +
>> +	struct device_node *np __free(device_node) =3D of_find_node_by_path("/=
");
>> +	if (!np)
>> +		return -ENOENT;
>
> This should never fail at this point, no? Also, can't we just use of_root=
?

Regarding of_root, please disregard my earlier comment. I mistakenly assume=
d
that it would also be guarded by CONFIG_OF.

But I still think we do not need the NULL check.

>> -	np =3D of_find_node_by_path("/");
>> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
>> -	of_node_put(np);
>> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>>  }
>> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
> If we want to export this, we shouldn't reuse the existing name, which is
> misleading.
>
> soc_device_get_machine() reads as if we return a reference count of somet=
hing.
> Additionally, it operates on struct soc_device_attribute instead of struc=
t
> soc_device, where the name suggests the latter.
>
> Instead this should be soc_device_attribute_read_machine() or if we want =
a
> shorter name, just soc_attr_read_machine().

