Return-Path: <linux-renesas-soc+bounces-18827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC858AEB069
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 09:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3501C21138
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 07:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5A7C2FB;
	Fri, 27 Jun 2025 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=growora.pl header.i=@growora.pl header.b="Hc5zRAVi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.growora.pl (mail.growora.pl [51.254.119.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB01E1C6BE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.254.119.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010373; cv=none; b=WYrZUeovlbCbdwHMr3i/2JNN+aM8LiuM84OMtW/XYt343elS+YMEoOjSC3H1kgDx+fsKj/diTPruFf0aJlnObnXneZ/yegt5guiuDO1LgIsqgb5Dgt2d8aE3/s/B5LbH/r5pwxtPgas9Qt/K6kv9P/UAfg3fkYIV2coLVDNQQZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010373; c=relaxed/simple;
	bh=EB99enkNQ3/lKc2PdUObvM5/Gi3NF8gZrWwaTOp5KYs=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=dFin91hSl6kiFD5gNlS3SiHyjcy923p+ms4wXAZMuSekGnVic1kSvn6ua6PQTfUsKS8Pia5cRn8PbKf/hBktHD/sI4xohbc+mRy4cM5kFRr6FuzJTLwrInUW3UsXkmT9wrWG9GAC7bwejvCIQ9rvhPpO9UXZTXUfl3LMa2WbnY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=growora.pl; spf=pass smtp.mailfrom=growora.pl; dkim=pass (2048-bit key) header.d=growora.pl header.i=@growora.pl header.b=Hc5zRAVi; arc=none smtp.client-ip=51.254.119.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=growora.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=growora.pl
Received: by mail.growora.pl (Postfix, from userid 1002)
	id ECF2B23B8E; Fri, 27 Jun 2025 09:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growora.pl; s=mail;
	t=1751010365; bh=EB99enkNQ3/lKc2PdUObvM5/Gi3NF8gZrWwaTOp5KYs=;
	h=Date:From:To:Subject:From;
	b=Hc5zRAVi/FiQo1cWJ4mNwmzWY5AfjifhL+oexpQglUwr5RaRSJTFgk/ivLiM+EHf4
	 u3PYovH9k+4fKdgioBUqQ8XS6skRvZEmzjby7fWkIhQ575oHbqZkayihAZcWt0GqK4
	 i8xd8eTVE34n9zxzKH+WLgWi0wg3cnp4Ert1d8fDjg/79aw2rX3BVW1PvoQkaqpvgO
	 h8vgiUlBOgE8KXzN7V47wUnqjqnE8PATmMragYZ6on/vZ9DQxTkXceDw2lhEQzg7Fj
	 HVIWOHUNWZg6bV1twA/OLqfqeb1XXToOaKab9mdzSRzIOiXEb9dK5ccY53xt+GRxm1
	 sMCucv6niJ80g==
Received: by mail.growora.pl for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 07:45:48 GMT
Message-ID: <20250627084500-0.1.ka.21kia.0.oxjtm5i2mm@growora.pl>
Date: Fri, 27 Jun 2025 07:45:48 GMT
From: "Mateusz Hopczak" <mateusz.hopczak@growora.pl>
To: <linux-renesas-soc@vger.kernel.org>
Subject: IT bez rekrutacji
X-Mailer: mail.growora.pl
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cze=C5=9B=C4=87,

wiem, =C5=BCe rozw=C3=B3j oprogramowania to dzi=C5=9B nie tylko kwestia t=
echnologii, ale tempa i dost=C4=99pno=C5=9Bci odpowiednich ludzi.=20

Je=C5=9Bli temat dotyczy r=C3=B3wnie=C5=BC Pa=C5=84stwa zespo=C5=82u, by=C4=
=87 mo=C5=BCe warto porozmawia=C4=87 o wsp=C3=B3=C5=82pracy, w kt=C3=B3re=
j to my przejmujemy ca=C5=82y proces tworzenia oprogramowania =E2=80=93 o=
d analizy po utrzymanie. Pracujemy elastycznie, dostosowuj=C4=85c si=C4=99=
 do wewn=C4=99trznych procedur i Waszego stacku technologicznego.

Dzia=C5=82amy tak, jakby=C5=9Bmy byli cz=C4=99=C5=9Bci=C4=85 zespo=C5=82u=
, ale bez operacyjnego ci=C4=99=C5=BCaru, ryzyka kosztownych rekrutacji, =
z elastycznym podej=C5=9Bciem i transparentnym modelem rozlicze=C5=84.

Czy jeste=C5=9Bcie Pa=C5=84stwo zainteresowani pog=C5=82=C4=99bieniem tem=
atu?


Pozdrawiam
Mateusz Hopczak

