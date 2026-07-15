Return-Path: <linux-renesas-soc+bounces-35232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AfG1DF7XVmpEBwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 02:42:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990C759BB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 02:42:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=QzV6iqfY;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 703DD302B83B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 00:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA30221DAE;
	Wed, 15 Jul 2026 00:42:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B4A1A304A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 00:41:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784076123; cv=none; b=eHLFK1zIhO2pmMgLG3KkyYXt1uZqEUyxgeQCNBLBpn2eutaqhREzaXi0yXNASb9M+n206QWQydwQhNlzt8nb9MG8Z2P+4Op52xsiBhqR+ZIZUM5y7amPQ5bajfEOXa1I1wLlPsqbzCQToWZ85vDMn+kdo/pabS4sjyzT49l+jpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784076123; c=relaxed/simple;
	bh=DPr0wYegcuq+JVZhtzFp/e1skzSIZtfMfeLJDfN3/Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZZ+zfUQfeAgjPDRPr0GIg5H2gCBgvOZXPWHMnFaz6caphmaEq6DkiZyyniulRhWOI7OW0wI/nDPuby1ZGmVsd73L2PZj+hD8HNdMgg6O3zV+CVG4B7M2Hpv3XN3RXF0NXYBzEq9AdKjj8Pf4nJ1lJ1GkjQNnMf7Z3dBChjIGwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzV6iqfY; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784076118; x=1815612118;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DPr0wYegcuq+JVZhtzFp/e1skzSIZtfMfeLJDfN3/Xc=;
  b=QzV6iqfYCgpcs+DXcqQkYly796+R2NTGOjB9KihbeHHC8wq/WCs8I1re
   1ecWBq7dSEUtnOn4Pn1VEOMwWvERP+egpl3ig1v8ZvwPvZzxaHFUELlQD
   hJar09NK+trnGzbptswXR7e8doVm5Zn+q0Hodv0+tNkRkjMvPid/8ZRcE
   5hT73t/8KO4uYc7YCjRDZsNurFvGr13jk8l67aXaxOBHQuy1mWX6aqrmw
   ju+YXyQ5/XF/D/R/Zl4YWBeMnvXhRJA8Bwy8byNrNuraha7h5fdS8lqaN
   HPW0N/AUi5jTQyrikH7vllXwJYeUSE+KYg68sO5oCJ6I+X4ufWaAyi4mL
   g==;
X-CSE-ConnectionGUID: 4aTCt6QnTlaJkTdJ72nqzg==
X-CSE-MsgGUID: uMQMbR69Ra6bDqH8MWO3bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102129551"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="102129551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 17:41:57 -0700
X-CSE-ConnectionGUID: OQL2AXoTRwqOTxAZnCXWaA==
X-CSE-MsgGUID: 0VjorAeaRL2wAABrc9OAIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="280434802"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jul 2026 17:41:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjnh7-00000000NAt-0Wuc;
	Wed, 15 Jul 2026 00:41:49 +0000
Date: Wed, 15 Jul 2026 08:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 39/55]
 drivers/scsi/zorro7xx.c:53:18: error: 'struct zorro_device_id' has no member
 named 'driver_data_ptr'; did you mean 'driver_data'?
Message-ID: <202607150855.G7wtKYQ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35232-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:martin.petersen@oracle.com,m:oe-kbuild-all@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:mid,intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,oracle.com:email,baylibre.com:email,zorro7xx_scsi_driver_template.name:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8990C759BB7

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git master
head:   cbf4a77e77ce7c4a2907a798c7f624dfaf65da57
commit: 64cc8891f8eadd40d05745099a8fad89482de67f [39/55] Merge remote-track=
ing branch 'scsi-mkp/for-next' into renesas-drivers
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260715=
/202607150855.G7wtKYQ7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260715/202607150855.G7wtKYQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607150855.G7wtKYQ7-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from include/linux/blk-mq.h:5,
                    from include/scsi/scsi_host.h:11,
                    from drivers/scsi/zorro7xx.c:22:
   include/linux/highmem.h: In function 'clear_user_pages':
   include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not u=
sed [-Wunused-but-set-parameter=3D]
     234 | static inline void clear_user_pages(void *addr, unsigned long va=
ddr,
         |                                                 ~~~~~~~~~~~~~~^~=
~~~
   drivers/scsi/zorro7xx.c: At top level:
>> drivers/scsi/zorro7xx.c:53:18: error: 'struct zorro_device_id' has no me=
mber named 'driver_data_ptr'; did you mean 'driver_data'?
      53 |                 .driver_data_ptr =3D &zorro7xx_driver_data[0],
         |                  ^~~~~~~~~~~~~~~
         |                  driver_data
>> drivers/scsi/zorro7xx.c:53:36: error: initialization of 'long unsigned i=
nt' from 'struct zorro_driver_data *' makes integer from pointer without a =
cast [-Wint-conversion]
      53 |                 .driver_data_ptr =3D &zorro7xx_driver_data[0],
         |                                    ^
   drivers/scsi/zorro7xx.c:53:36: note: (near initialization for 'zorro7xx_=
zorro_tbl[0].driver_data')
   drivers/scsi/zorro7xx.c:57:18: error: 'struct zorro_device_id' has no me=
mber named 'driver_data_ptr'; did you mean 'driver_data'?
      57 |                 .driver_data_ptr =3D &zorro7xx_driver_data[1],
         |                  ^~~~~~~~~~~~~~~
         |                  driver_data
   drivers/scsi/zorro7xx.c:57:36: error: initialization of 'long unsigned i=
nt' from 'struct zorro_driver_data *' makes integer from pointer without a =
cast [-Wint-conversion]
      57 |                 .driver_data_ptr =3D &zorro7xx_driver_data[1],
         |                                    ^
   drivers/scsi/zorro7xx.c:57:36: note: (near initialization for 'zorro7xx_=
zorro_tbl[1].driver_data')
   drivers/scsi/zorro7xx.c:61:18: error: 'struct zorro_device_id' has no me=
mber named 'driver_data_ptr'; did you mean 'driver_data'?
      61 |                 .driver_data_ptr =3D &zorro7xx_driver_data[2],
         |                  ^~~~~~~~~~~~~~~
         |                  driver_data
   drivers/scsi/zorro7xx.c:61:36: error: initialization of 'long unsigned i=
nt' from 'struct zorro_driver_data *' makes integer from pointer without a =
cast [-Wint-conversion]
      61 |                 .driver_data_ptr =3D &zorro7xx_driver_data[2],
         |                                    ^
   drivers/scsi/zorro7xx.c:61:36: note: (near initialization for 'zorro7xx_=
zorro_tbl[2].driver_data')
   drivers/scsi/zorro7xx.c:65:18: error: 'struct zorro_device_id' has no me=
mber named 'driver_data_ptr'; did you mean 'driver_data'?
      65 |                 .driver_data_ptr =3D &zorro7xx_driver_data[2],
         |                  ^~~~~~~~~~~~~~~
         |                  driver_data
   drivers/scsi/zorro7xx.c:65:36: error: initialization of 'long unsigned i=
nt' from 'struct zorro_driver_data *' makes integer from pointer without a =
cast [-Wint-conversion]
      65 |                 .driver_data_ptr =3D &zorro7xx_driver_data[2],
         |                                    ^
   drivers/scsi/zorro7xx.c:65:36: note: (near initialization for 'zorro7xx_=
zorro_tbl[3].driver_data')
   drivers/scsi/zorro7xx.c:69:18: error: 'struct zorro_device_id' has no me=
mber named 'driver_data_ptr'; did you mean 'driver_data'?
      69 |                 .driver_data_ptr =3D &zorro7xx_driver_data[3],
         |                  ^~~~~~~~~~~~~~~
         |                  driver_data
   drivers/scsi/zorro7xx.c:69:36: error: initialization of 'long unsigned i=
nt' from 'struct zorro_driver_data *' makes integer from pointer without a =
cast [-Wint-conversion]
      69 |                 .driver_data_ptr =3D &zorro7xx_driver_data[3],
         |                                    ^
   drivers/scsi/zorro7xx.c:69:36: note: (near initialization for 'zorro7xx_=
zorro_tbl[4].driver_data')
   drivers/scsi/zorro7xx.c: In function 'zorro7xx_init_one':
>> drivers/scsi/zorro7xx.c:84:20: error: 'const struct zorro_device_id' has=
 no member named 'driver_data_ptr'; did you mean 'driver_data'?
      84 |         zdd =3D ent->driver_data_ptr;
         |                    ^~~~~~~~~~~~~~~
         |                    driver_data


vim +53 drivers/scsi/zorro7xx.c

45804fbb00eea2 Kars de Jong                       2007-06-17   49 =20
6f039790510fd6 Greg Kroah-Hartman                 2012-12-21   50  static s=
truct zorro_device_id zorro7xx_zorro_tbl[] =3D {
45804fbb00eea2 Kars de Jong                       2007-06-17   51  	{
45804fbb00eea2 Kars de Jong                       2007-06-17   52  		.id =
=3D ZORRO_PROD_PHASE5_BLIZZARD_603E_PLUS,
de47b015c8f4e0 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26  @53) 		.=
driver_data_ptr =3D &zorro7xx_driver_data[0],
45804fbb00eea2 Kars de Jong                       2007-06-17   54  	},
45804fbb00eea2 Kars de Jong                       2007-06-17   55  	{
45804fbb00eea2 Kars de Jong                       2007-06-17   56  		.id =
=3D ZORRO_PROD_MACROSYSTEMS_WARP_ENGINE_40xx,
de47b015c8f4e0 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26   57) 		.=
driver_data_ptr =3D &zorro7xx_driver_data[1],
45804fbb00eea2 Kars de Jong                       2007-06-17   58  	},
45804fbb00eea2 Kars de Jong                       2007-06-17   59  	{
45804fbb00eea2 Kars de Jong                       2007-06-17   60  		.id =
=3D ZORRO_PROD_CBM_A4091_1,
de47b015c8f4e0 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26   61) 		.=
driver_data_ptr =3D &zorro7xx_driver_data[2],
45804fbb00eea2 Kars de Jong                       2007-06-17   62  	},
45804fbb00eea2 Kars de Jong                       2007-06-17   63  	{
45804fbb00eea2 Kars de Jong                       2007-06-17   64  		.id =
=3D ZORRO_PROD_CBM_A4091_2,
de47b015c8f4e0 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26   65) 		.=
driver_data_ptr =3D &zorro7xx_driver_data[2],
45804fbb00eea2 Kars de Jong                       2007-06-17   66  	},
45804fbb00eea2 Kars de Jong                       2007-06-17   67  	{
45804fbb00eea2 Kars de Jong                       2007-06-17   68  		.id =
=3D ZORRO_PROD_GVP_GFORCE_040_060,
de47b015c8f4e0 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26   69) 		.=
driver_data_ptr =3D &zorro7xx_driver_data[3],
45804fbb00eea2 Kars de Jong                       2007-06-17   70  	},
317f042e2e273d Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26   71) 	{ }
45804fbb00eea2 Kars de Jong                       2007-06-17   72  };
bf54a2b3c0dbf7 Geert Uytterhoeven                 2008-11-18   73  MODULE_D=
EVICE_TABLE(zorro, zorro7xx_zorro_tbl);
45804fbb00eea2 Kars de Jong                       2007-06-17   74 =20
6f039790510fd6 Greg Kroah-Hartman                 2012-12-21   75  static i=
nt zorro7xx_init_one(struct zorro_dev *z,
45804fbb00eea2 Kars de Jong                       2007-06-17   76  			     =
const struct zorro_device_id *ent)
45804fbb00eea2 Kars de Jong                       2007-06-17   77  {
bbfbbbc1182f8b Mariusz Kozlowski                  2007-08-11   78  	struct =
Scsi_Host *host;
45804fbb00eea2 Kars de Jong                       2007-06-17   79  	struct =
NCR_700_Host_Parameters *hostdata;
de47b015c8f4e0 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26   80) 	co=
nst struct zorro_driver_data *zdd;
45804fbb00eea2 Kars de Jong                       2007-06-17   81  	unsigne=
d long board, ioaddr;
45804fbb00eea2 Kars de Jong                       2007-06-17   82 =20
45804fbb00eea2 Kars de Jong                       2007-06-17   83  	board =
=3D zorro_resource_start(z);
de47b015c8f4e0 Uwe Kleine-K=C3=B6nig (The Capable Hub  2026-05-26  @84) 	zd=
d =3D ent->driver_data_ptr;
45804fbb00eea2 Kars de Jong                       2007-06-17   85 =20
45804fbb00eea2 Kars de Jong                       2007-06-17   86  	if (zdd=
->absolute) {
45804fbb00eea2 Kars de Jong                       2007-06-17   87  		ioaddr=
 =3D zdd->offset;
45804fbb00eea2 Kars de Jong                       2007-06-17   88  	} else {
45804fbb00eea2 Kars de Jong                       2007-06-17   89  		ioaddr=
 =3D board + zdd->offset;
45804fbb00eea2 Kars de Jong                       2007-06-17   90  	}
45804fbb00eea2 Kars de Jong                       2007-06-17   91 =20
45804fbb00eea2 Kars de Jong                       2007-06-17   92  	if (!zo=
rro_request_device(z, zdd->name)) {
45804fbb00eea2 Kars de Jong                       2007-06-17   93  		printk=
(KERN_ERR "zorro7xx: cannot reserve region 0x%lx, abort\n",
45804fbb00eea2 Kars de Jong                       2007-06-17   94  		      =
 board);
45804fbb00eea2 Kars de Jong                       2007-06-17   95  		return=
 -EBUSY;
45804fbb00eea2 Kars de Jong                       2007-06-17   96  	}
45804fbb00eea2 Kars de Jong                       2007-06-17   97 =20
bf4afc53b77aea Linus Torvalds                     2026-02-21   98  	hostdat=
a =3D kzalloc_obj(struct NCR_700_Host_Parameters);
bbfbbbc1182f8b Mariusz Kozlowski                  2007-08-11   99  	if (!ho=
stdata) {
45804fbb00eea2 Kars de Jong                       2007-06-17  100  		printk=
(KERN_ERR "zorro7xx: Failed to allocate host data\n");
45804fbb00eea2 Kars de Jong                       2007-06-17  101  		goto o=
ut_release;
45804fbb00eea2 Kars de Jong                       2007-06-17  102  	}
45804fbb00eea2 Kars de Jong                       2007-06-17  103 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  104  	/* Fill=
 in the required pieces of hostdata */
45804fbb00eea2 Kars de Jong                       2007-06-17  105  	if (ioa=
ddr > 0x01000000)
45804fbb00eea2 Kars de Jong                       2007-06-17  106  		hostda=
ta->base =3D ioremap(ioaddr, zorro_resource_len(z));
45804fbb00eea2 Kars de Jong                       2007-06-17  107  	else
6112ea0862faca Geert Uytterhoeven                 2011-01-09  108  		hostda=
ta->base =3D ZTWO_VADDR(ioaddr);
45804fbb00eea2 Kars de Jong                       2007-06-17  109 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  110  	hostdat=
a->clock =3D 50;
45804fbb00eea2 Kars de Jong                       2007-06-17  111  	hostdat=
a->chip710 =3D 1;
45804fbb00eea2 Kars de Jong                       2007-06-17  112 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  113  	/* Sett=
ings for at least WarpEngine 40xx */
45804fbb00eea2 Kars de Jong                       2007-06-17  114  	hostdat=
a->ctest7_extra =3D CTEST7_TT1;
45804fbb00eea2 Kars de Jong                       2007-06-17  115 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  116  	zorro7x=
x_scsi_driver_template.name =3D zdd->name;
45804fbb00eea2 Kars de Jong                       2007-06-17  117 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  118  	/* and =
register the chip */
45804fbb00eea2 Kars de Jong                       2007-06-17  119  	host =
=3D NCR_700_detect(&zorro7xx_scsi_driver_template, hostdata,
45804fbb00eea2 Kars de Jong                       2007-06-17  120  			     =
 &z->dev);
45804fbb00eea2 Kars de Jong                       2007-06-17  121  	if (!ho=
st) {
45804fbb00eea2 Kars de Jong                       2007-06-17  122  		printk=
(KERN_ERR "zorro7xx: No host detected; "
45804fbb00eea2 Kars de Jong                       2007-06-17  123  				"boa=
rd configuration problem?\n");
45804fbb00eea2 Kars de Jong                       2007-06-17  124  		goto o=
ut_free;
45804fbb00eea2 Kars de Jong                       2007-06-17  125  	}
45804fbb00eea2 Kars de Jong                       2007-06-17  126 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  127  	host->t=
his_id =3D 7;
45804fbb00eea2 Kars de Jong                       2007-06-17  128  	host->b=
ase =3D ioaddr;
45804fbb00eea2 Kars de Jong                       2007-06-17  129  	host->i=
rq =3D IRQ_AMIGA_PORTS;
45804fbb00eea2 Kars de Jong                       2007-06-17  130 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  131  	if (req=
uest_irq(host->irq, NCR_700_intr, IRQF_SHARED, "zorro7xx-scsi",
45804fbb00eea2 Kars de Jong                       2007-06-17  132  			host)=
) {
45804fbb00eea2 Kars de Jong                       2007-06-17  133  		printk=
(KERN_ERR "zorro7xx: request_irq failed\n");
45804fbb00eea2 Kars de Jong                       2007-06-17  134  		goto o=
ut_put_host;
45804fbb00eea2 Kars de Jong                       2007-06-17  135  	}
45804fbb00eea2 Kars de Jong                       2007-06-17  136 =20
3ac709c113daa1 Matthew Wilcox                     2007-07-17  137  	zorro_s=
et_drvdata(z, host);
45804fbb00eea2 Kars de Jong                       2007-06-17  138  	scsi_sc=
an_host(host);
45804fbb00eea2 Kars de Jong                       2007-06-17  139 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  140  	return =
0;
45804fbb00eea2 Kars de Jong                       2007-06-17  141 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  142   out_put=
_host:
45804fbb00eea2 Kars de Jong                       2007-06-17  143  	scsi_ho=
st_put(host);
45804fbb00eea2 Kars de Jong                       2007-06-17  144   out_fre=
e:
45804fbb00eea2 Kars de Jong                       2007-06-17  145  	if (ioa=
ddr > 0x01000000)
45804fbb00eea2 Kars de Jong                       2007-06-17  146  		iounma=
p(hostdata->base);
45804fbb00eea2 Kars de Jong                       2007-06-17  147  	kfree(h=
ostdata);
45804fbb00eea2 Kars de Jong                       2007-06-17  148   out_rel=
ease:
45804fbb00eea2 Kars de Jong                       2007-06-17  149  	zorro_r=
elease_device(z);
45804fbb00eea2 Kars de Jong                       2007-06-17  150 =20
45804fbb00eea2 Kars de Jong                       2007-06-17  151  	return =
-ENODEV;
45804fbb00eea2 Kars de Jong                       2007-06-17  152  }
45804fbb00eea2 Kars de Jong                       2007-06-17  153 =20

:::::: The code at line 53 was first introduced by commit
:::::: de47b015c8f4e03e1571ea5298df8d2792ea4975 scsi: zorro7xx: Make use of=
 struct zorro_device_id::driver_data_ptr

:::::: TO: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibr=
e.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

