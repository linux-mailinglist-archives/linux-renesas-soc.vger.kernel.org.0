Return-Path: <linux-renesas-soc+bounces-27966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOYRG3czhWkl+AMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 01:19:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6FF88BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 01:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0F32300F167
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 00:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C531DFDB8;
	Fri,  6 Feb 2026 00:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zrgdw+iR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02104CA4E;
	Fri,  6 Feb 2026 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337141; cv=none; b=lweKwvuXKcQDuOt6cekBjW1nv33bkgyh6mY7KDCBpDcqgIDXnLlrjctHoIswCvPquzb9pekUIDbDJpVmAViCPmR++VhLyDkVc0IG176XMbd42EHwB5Bqp7iJWNHHhcC0/md5Wd1D3YE0dXdkEhm+/tbM5+UpWhbwQHtAIJSBIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337141; c=relaxed/simple;
	bh=V8opFpQ39R30vQfM2h6i3ZrP+S7JGt1EHVc/iQHSGPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VkZuC8KDqkqRdugVWbNs3kd+W1PXg9cq6AcTJz5tCEHljNSK70xjDpPep4XSKhd4mYi8pSWwj2fKNbDa8FEKOqZcRKVzm7NUdhyCJNYK2r8qcB7r6CSNHlyp3BEhW/vcaBhxV2XYYY/+hQD+Pne1h5exJUXjuPVUazls0KioHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zrgdw+iR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F94C4CEF7;
	Fri,  6 Feb 2026 00:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770337140;
	bh=V8opFpQ39R30vQfM2h6i3ZrP+S7JGt1EHVc/iQHSGPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zrgdw+iRA1ATXi9YtrIOUNfoEGQyYcVZflrperRFRa7onPiiZVy/Z2Uh5CCr6oqxT
	 2mzx/Fb2hQDFQT42VmM9KoTfxJUFSyhrmj7SxJe4t6By/burc8tdjmHVORQjS2G6/j
	 B8vUO912/d/BKqOQRmV+9F0H78jmRLwiTBcAc5dh7kfZk9YYwjiSrNKqF/euwtwk2O
	 P2HXmmrNc7Pjktu9GEtFNFvRnKELssJKl5oj5Ujb3mQVnZfZYNsi45FWnsDGPmej4B
	 8qhksnacuaRzyzN5ayXz6WkjiDBiT1VJR4wcNxi6xWDdjTBzCOZooiueUT8EKUS35b
	 cwhrWilWdVDCw==
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
In-Reply-To: <20260205-schneider-6-19-rc1-qspi-v5-0-843632b3c674@bootlin.com>
References: <20260205-schneider-6-19-rc1-qspi-v5-0-843632b3c674@bootlin.com>
Subject: Re: (subset) [PATCH v5 0/4] spi: cadence-qspi: Add Renesas RZ/N1
 support
Message-Id: <177033713720.233295.10091402789767547570.b4-ty@kernel.org>
Date: Fri, 06 Feb 2026 00:18:57 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27966-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0A6FF88BA
X-Rspamd-Action: no action

On Thu, 05 Feb 2026 19:09:47 +0100, Miquel Raynal (Schneider Electric) wrote:
> This series adds support for the QSPI controller available on Renesas
> RZ/N1S and RZ/N1D SoC. It has been tested with a custom board (see last
> SPI patch for details), but has been tested by Wolfram (thank you!) on
> the DB board.
> Link: https://lore.kernel.org/linux-devicetree/20260116114852.52948-2-wsa+renesas@sang-engineering.com/
> 
> Adding support for this SoC required a few adaptations to the Cadence
> QSPI driver which have already been merged (except one regarding clocks
> handling). This series contains the remaining patches, the ones actually
> adding support for the RZ/N1 flavour.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
      commit: 2b97f5cd1a956a9ac948ec57775600158988dadd
[2/4] spi: cadence-qspi: Kill cqspi_jh7110_clk_init
      commit: 324ecc7788c2e21d0d9197a8c015ff75382122d9
[3/4] spi: cadence-qspi: Add support for the Renesas RZ/N1 controller
      commit: a40236feb62ccbf2b36d288550a483122b3205e5

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


