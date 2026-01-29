Return-Path: <linux-renesas-soc+bounces-27602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNDcKPdAe2nECwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:13:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AEAF7E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A532D300599B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0C385535;
	Thu, 29 Jan 2026 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFljJ7uc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4E3793D9;
	Thu, 29 Jan 2026 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685236; cv=none; b=Q+nS1T3wDPe8B2MKYdpyxu1Z+qVBK9zLf/e6pmZXsK1RfbmHH8n+OMNOKvr/uPkINwdjnftWIFaiJdXOVyFunIhFKWAmddI6XkaiUhz++VzMp23nX9hAetQmZza7FRDtg54iOsiPl4HFwgR8PDcy71+OCqb1IGa+sv3dP+Pwwbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685236; c=relaxed/simple;
	bh=zfJWVAxG9Q672zCrZytwBLKjJfe7fxZIheGtzUrbzso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LPa82ocuRoFBG4Z6hFCRYy3CHmiFOxcmzQ5k4m/TyIF4Vj4OaEOi0B2lZHSYALY60rJNh+ucnyTSotwmndBXGdHOa9ABQ2lTqZL0t2meKUjIZC618znTTJJXEHjnn4RLrQrltos2b23k0GVTfhQaFIQ+/rGyJ92rk0PKRS4ZXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFljJ7uc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158FFC4CEF7;
	Thu, 29 Jan 2026 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769685236;
	bh=zfJWVAxG9Q672zCrZytwBLKjJfe7fxZIheGtzUrbzso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MFljJ7ucKl3VuJJ5LbKELVc9mhCH6g9olm8EMiF0KHxvi394aVjA8lxxh7wVNLmBY
	 WkBLHVcmkIWY9rT0D+DmsBycwXCmc3JMj7Ed1gVnccBC/yf9BPWFqqDKxP7GrRuP1I
	 ItsiJl4IrJ630+Pj02Q1U3g+zC6zpw6u3V20cDJ0P1PzF8BrYc/BO/mrGotNbiYK9x
	 WoIXfnKhq0Uf5Cp4FfGfkiIOt16QN5YqOeg0P0nDTzsuvcigf+DqKa8nFVAU8dcV4d
	 /0uptfk3KRyzMqtfZgL2mKocFheX3IInv3m/msIA/32TlfWRCka1K0IJhUfcfPE6BU
	 Q9eE4HkZKOZMg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
Subject: Re: (subset) [PATCH v4 00/15] spi: cadence-qspi: Add Renesas RZ/N1
 support
Message-Id: <176968523282.21695.1970063208785534195.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 11:13:52 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27602-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B5AEAF7E2
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 16:13:25 +0100, Miquel Raynal (Schneider Electric) wrote:
> This series adds support for the QSPI controller available on Renesas
> RZ/N1S and RZ/N1D SoC. It has been tested with a custom board (see last
> SPI patch for details), but has been tested by Wolfram (thank you!) on
> the DB board.
> Link: https://lore.kernel.org/linux-devicetree/20260116114852.52948-2-wsa+renesas@sang-engineering.com/
> 
> Adding support for this SoC required a few adaptations in the Cadence
> QSPI driver. The bulk of the work is in the few last patches. Everything
> else is just misc style fixes and improvements which bothered me while I
> was wandering.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/15] spi: dt-bindings: cdns,qspi-nor: Drop label in example
        commit: ade3f7f883723cca5e1c967e574680b410226566
[02/15] spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
        (no commit info)
[03/15] spi: cadence-qspi: Align definitions
        commit: 9dfc9c1c830717686908e2c16867d8dfae5cf5e7
[04/15] spi: cadence-qspi: Fix style and improve readability
        commit: aac733a9663682387013350b4470a81344960f5d
[05/15] spi: cadence-qspi: Fix ORing style and alignments
        commit: ec2da8bb0bc518ca5458d36de9aeec493ed5a790
[06/15] spi: cadence-qspi: Remove an useless operation
        commit: 453c5d60d896398c32854b683aff6d5b8386fa03
[07/15] spi: cadence-qspi: Make sure we filter out unsupported ops
        commit: bee085476d277e1f993cdec57e3c730f536594f0
[08/15] spi: cadence-qspi: Fix probe error path and remove
        commit: f18c8cfa4f1af2cf7d68d86989a7d6109acfa1bb
[09/15] spi: cadence-qspi: Try hard to disable the clocks
        commit: 612227b392eed94a3398dc03334a84a699a82276
[10/15] spi: cadence-qspi: Kill cqspi_jh7110_clk_init
        (no commit info)
[11/15] spi: cadence-qspi: Add a flag for controllers without indirect access support
        commit: ae62e7cf6ab52cebc83feb0bcb374082eaabbf5e
[12/15] spi: cadence-qspi: Make sure write protection is disabled
        commit: 590f2430733f1302a78ac405370b8f01038adbf5
[13/15] spi: cadence-qspi: Use a default value for cdns,fifo-width
        commit: 77ee3ba5d4152f01ba4674b0e0ae51f8a51250bf
[14/15] spi: cadence-qspi: Add support for the Renesas RZ/N1 controller
        (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


