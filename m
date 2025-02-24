Return-Path: <linux-renesas-soc+bounces-13565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A09A41D7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 12:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43E9B1777F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 11:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22A62571D3;
	Mon, 24 Feb 2025 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qRLGvMGb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z9I5swiA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE092571CA;
	Mon, 24 Feb 2025 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740396123; cv=none; b=FtFNeIIFRM+23O/udnWUrKAsHm8BctihMEFylfSxJmBPDluic9eQtAI1kQRMeNrpvsg9FVkmyvlsUYQR6DfzKZWDMS4G2aJkhWrwDYy0JHKlqkowL0/ZCVj6Mso65k/JEKEFR2BIUWIitnwY3bzV9rOHx64TZROBMtDRHtVndQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740396123; c=relaxed/simple;
	bh=K9iWP4FjB4bvOCppsx5VPXEmIJ7JQcPwHRmuccPVLdM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q8TYMguoIaYSza+eE2lgcnsHUFDw/rCyvTmZKqMSVNkX205Jj7XnQ/OTkNqk5li0hqd4FETWttCmx08QtHOCqh3u6Ik+qycpE8uzOec4b7FtZdffEqGDC7Xs1qqkHN06ZyBJcNKLIv1hczFWgBBHlDa9XLhsR2clMuR7F65OE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qRLGvMGb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z9I5swiA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740396119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vEKIKRdpA2IuURdWpoDhDR4OR8ZsWof+GEE24oN5KD8=;
	b=qRLGvMGbPAqlHPiU0Uk91qFQREXPmalqm9alZAeWs4EjpCbxSsSyUgtmkJRbttkcNHBabm
	7PfFhztVhq7towQrt3I+vHYG1p3Hp+elPAzPY47l//ojv2M8bK08R7vPyRSP+gWCWlRnFv
	eKgNtb0dZbZph/T3GafiDSILrviOHK96Lbh405MozYsR/OVETQUMDrARyW+FBWOVq9iMwd
	GtsOLYgxR1AtpgYvb1FDnH8C6xdeP3osiwxUtmH3Bfxc8m1HVJnabjI0LgobSrXsMfEBC9
	zRy/Dh89EwJ9fmh0PzpTofwU1mugkd2UjNHMrwYlUKHNWoxGvaGbfwC7ACz6UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740396119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vEKIKRdpA2IuURdWpoDhDR4OR8ZsWof+GEE24oN5KD8=;
	b=Z9I5swiAf+lLt0MADWzW+RN+GZN6mqNR9e+2VLTrD9gYOVStzyf99TKf57DrRw+zc9ttki
	gVRj1bLbjz8aA6BQ==
To: Biju Das <biju.das.jz@bp.renesas.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>
Subject: RE: [PATCH v5 00/12] Add Support for RZ/G3E ICU
In-Reply-To: <TY3PR01MB11346EAE435572E11B276BE1C86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346EAE435572E11B276BE1C86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Date: Mon, 24 Feb 2025 12:21:59 +0100
Message-ID: <87y0xvfuzs.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 24 2025 at 10:48, Biju Das wrote:
> Gentle ping. Should I rebase to [1] and resend.
> Please let me know.
>
> [1] https://lore.kernel.org/all/20250220150110.738619-5-fabrizio.castro.jz@renesas.com/

Yes. I've marked this series obsolete due to the discussion about patch
10.

Please rebase on top of tip irq/drivers.

Thanks,

        tglx



