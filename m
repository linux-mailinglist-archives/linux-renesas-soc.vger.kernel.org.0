Return-Path: <linux-renesas-soc+bounces-17770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35363ACAA2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 09:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FDBA189AF72
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 07:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18CF1BEF8C;
	Mon,  2 Jun 2025 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YydjiPF2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A413150980;
	Mon,  2 Jun 2025 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850972; cv=none; b=qhdCp2rf6pl9ormMzqy8hF7rwFgOYgCmP4la+rhWDTCuma7jL2SomrDwrGrrJHQQp7e0TqmRAqx95BTeulmMqNsYBg6nIzi8UuluCp3D/WsnPkHB6UIAD6ZbhlidZjVnzb3WHL0cjbPytr5+xGxsQWQHUG10mU62yIpZ09wMeHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850972; c=relaxed/simple;
	bh=LwGsbLvPxzcXzW6rl8H3BJiQjCme09KUZ58Af/olC7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsoG6Liic+TQsMnrDN/6rDfUMJoOEhHMPap69zIzqXVTKMnOWCFLd+ftxyJgzu29don8DFYTSbLS7L3QvAVLQZ3bX5AmQ46b9hlV9ZHqC5uSKrQT17ybso7xdXjdmc+wy3zU4K8dnX4hBNaAzIJ+8w8FqKXOcLrMU0VQNyGXOx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YydjiPF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB23C4CEEB;
	Mon,  2 Jun 2025 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748850972;
	bh=LwGsbLvPxzcXzW6rl8H3BJiQjCme09KUZ58Af/olC7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YydjiPF2mUtb9ZytjhEbGEatORIXF2LxUtoaNiMwP5/5PqCyf2XFCCpK1Gn0BG4ga
	 o4MyBvSo31YML3q1akz74+J1GRm5NhrS89Y0+DtHTsfqa9ApfNJWcNB1yQUdJHrNsR
	 yHtc4Ov/TtBb7t0pVeSt0AalJKAt1QDMvMM0ND315Y1fT7kmtIKFsF+LjHP96OKhSv
	 g40TiFYQVSkVts0JBbuo2kBaqEzF2GHqFdZcWPlvZvYWiOob+VQgIiWB4lUGsgB10G
	 LujD1dPeEvejECYgmY1bYyASYHM88FV8KHerjm2Qp5wl6Dbm5i+mH1jYDRXk8WGvLM
	 NJsZf1H9qPg8w==
Date: Mon, 2 Jun 2025 09:56:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	grant.peltier.jg@renesas.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: (pmbus/isl68137) Add
 RAA229621 support
Message-ID: <20250602-gentle-horned-salamander-f85eae@kuoka>
References: <20250602050415.848112-1-chiang.brian@inventec.com>
 <20250602050415.848112-2-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602050415.848112-2-chiang.brian@inventec.com>

On Mon, Jun 02, 2025 at 01:04:14PM GMT, Chiang Brian wrote:
> Add device type support for raa229621
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> ---
> v1 -> v4:
> - Correct the subject and commit message
> - Patch kept in sync with series version
> - Link to v1: https://lore.kernel.org/all/20250314032055.3125534-1-chiang.brian@inventec.com/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


